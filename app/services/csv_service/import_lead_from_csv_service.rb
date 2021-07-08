# frozen_string_literal: true

module CsvService
  class ImportLeadFromCsvService
    include ActiveModel::Model
    include BaseService
    require "nkf"

    def initialize(csv_file:, vendor_group:, row_limit: 5000)
      @csv = csv_file
      @vendor_group = vendor_group
      @objects = []
      @updatable_columns = Lead.column_names.map(&:to_sym)
      @updatable_columns.delete(:id)

      raise ArgumentError, "CSVファイルを選択してください。" if @csv.blank?

      return if File.open(@csv.path).count <= row_limit
      raise ArgumentError, "CSVファイルの行数が#{row_limit}行を超えています。#{row_limit}行以内のファイルしか読み取れません。お手数ですが再度CSVファイルを分割してお試しください。"
    end


    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Metrics/PerceivedComplexity
    # rubocop:disable Metrics/BlockLength
    def perform
      CSV.foreach(@csv.path, headers: true, encoding: analyze_encoding, skip_blanks: true).with_index(2) do |row, row_number|
        # 空の行をスキップ
        next if row.fields.uniq.size == 1 && row.fields.uniq[0].blank?

        object = @vendor_group.leads.build()
        attrs = {}
        row.each do |key, value|
          column = @vendor_group.table_columns.find_by(table_type: "lead", name: key)

          raise ArgumentError, "<b>インポートしたCSVの[#{key}]が存在しません</b><br />" if column.blank?

          case column.data_type
          when "company"
            attrs[column.table_attribute] = @vendor_group.partners.where(name: value)&.last&.id
          when "product"
            attrs[column.table_attribute] = @vendor_group.products.where(name: value)&.last&.id
          when "staff"
            # FIXME: 同姓同名対策
            attrs[column.table_attribute] = @vendor_group.staffs.where(name: value)&.last&.id
          when "select_item"
            # FIXME: 同名選択肢対策
            attrs[column.table_attribute] = TableColumnSelectItem.where(name: value)&.last&.id
          when "lead_phase"
            attrs[column.table_attribute] =  @vendor_group.lead_phases.where(name: value)&.last&.id
          when "datetime"
            attrs[column.table_attribute] = value
          when "unique_key", "name", "city", "string", "integer", "float", "price", "text"
            attrs[column.table_attribute] = value
          end
        end
        p attrs
        object.assign_attributes(attrs)
        object.uid = ULID.generate

        raise_validation_error(object, row_number) unless object.valid?

        @objects << object
      end


      @updatable_columns
      Lead.import(@objects, on_duplicate_key_update: @updatable_columns)
      StrackService.perform(vendor_group: @vendor_group, ids: @objects.pluck(:company_id).uniq, table: "company", target_table: "lead")
      StrackService.perform(vendor_group: @vendor_group, ids: @objects.pluck(:contract_id).uniq, table: "contract", target_table: "lead")
    rescue Encoding::InvalidByteSequenceError
      raise StandardError, "<b>インポートしたCSVの#{row_number}行目でエラーが起きました。</b><br />ファイルの必要項目が入力されているか確認してください。<br /><br />"
    end
    # rubocop:eable Metrics/AbcSize
    # rubocop:eable Metrics/CyclomaticComplexity
    # rubocop:eable Metrics/MethodLength
    # rubocop:eable Metrics/PerceivedComplexity
    # rubocop:eable Metrics/BlockLength

    private
      def analyze_encoding
        # CSVの文字コードを解読して最適なエンコーディングを行う
        headers_str = File.open(@csv.path).readline
        encoding    = NKF.guess(headers_str)
        encoding    = "BOM|#{encoding}" if encoding == Encoding::UTF_8
        encoding
      end

      # FIXME 例外処理でなくて、エラー + エラーメッセージにする
      def raise_validation_error(data, row_number)
        data.errors.delete(:unique_key) if data.errors.added?(:unique_key, "\u304C\u65E2\u306B\u4F7F\u308F\u308C\u3066\u3044\u307E\u3059")

        if data.errors.any?
          errors = data.errors.full_messages.join("\u3002<br />\u30FB")
          raise ArgumentError, "<b>インポートしたCSVの#{row_number}行目でエラーが起きました。</b><br />・#{errors}"
        end
      end
  end
end
