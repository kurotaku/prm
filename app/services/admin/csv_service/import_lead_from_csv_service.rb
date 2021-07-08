# frozen_string_literal: true

module Admin
  module CsvService
    class ImportLeadFromCsvService
      include ActiveModel::Model
      include BaseService
      require "nkf"

      def initialize(csv_file:, vendor_group:, product:, row_limit: 5000)
        @csv = csv_file
        @vendor_group_id = vendor_group.id
        @product_id = product.id
        @new_objects = []
        @updatable_columns = Lead.column_names.map(&:to_sym)
        @updatable_columns.delete(:id)

        raise ArgumentError, "CSV\u30D5\u30A1\u30A4\u30EB\u3092\u9078\u629E\u3057\u3066\u304F\u3060\u3055\u3044\u3002" if @csv.blank?

        return if File.open(@csv.path).count <= row_limit

        raise ArgumentError, "CSVファイルの行数が#{row_limit}行を超えています。#{row_limit}行以内のファイルしか読み取れません。お手数ですが再度CSVファイルを分割してお試しください。"
      end

      def perform
        CSV.foreach(@csv.path, headers: true, encoding: analyze_encoding, skip_blanks: true).with_index(2) do |row, _row_number|
          # 空の行をスキップ
          next if row.fields.uniq.size == 1 && row.fields.uniq[0].blank?

          object = Lead.new(vendor_group_id: @vendor_group_id, product_id: @product_id)
          object.assign_attributes(row)
          @new_objects << object
        end

        p "============"
        p @updatable_columns
        Lead.import(@new_objects, on_duplicate_key_update: @updatable_columns)
      end

      private
        def analyze_encoding
          # CSVの文字コードを解読して最適なエンコーディングを行う
          headers_str = File.open(@csv.path).readline
          encoding    = NKF.guess(headers_str)
          encoding    = "BOM|#{encoding}" if encoding == Encoding::UTF_8
          encoding
        end

        # FIXME: 例外処理でなくて、エラー + エラーメッセージにする
        def raise_validation_error(data, row_number)
          errors = data.errors.full_messages.join("\u3002<br />\u30FB")
          raise ArgumentError, "<b>インポートしたCSVの#{row_number}行目でエラーが起きました。</b><br />ファイルの必要項目が入力されているか確認してください。<br /><br />・#{errors}"
        end
    end
  end
end
