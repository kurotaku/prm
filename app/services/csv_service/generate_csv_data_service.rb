# frozen_string_literal: true

module CsvService
  class GenerateCsvDataService
    include ActiveModel::Model
    include BaseService

    def initialize(index_columns, objects)
      @index_columns = index_columns
      @objects = objects

      raise ArgumentError, "\u30AA\u30D6\u30B8\u30A7\u30AF\u30C8\u3092\u5165\u529B\u3057\u3066\u304F\u3060\u3055\u3044\u3002" if @objects.blank?
    end

    def perform
      CSV.generate(force_quotes: true, row_sep: "\r\n", encoding: Encoding::SJIS) do |csv|
        branch_class(csv)
      end
    end

    private
      def branch_class(csv)
        case @objects.last.class.to_s
        when "Lead" then generate_leads_info csv
        else
          raise ArgumentError, "#{@objects.last.class} オブジェクトは非対応です。"
        end
      end

      def generate_leads_info(csv)
        header = lead_header
        csv << header
        @objects.find_each do |object|
          body = lead_body(object)
          csv << body
        end
      end

      def lead_header
        th = []
        @index_columns.each do |index_column|
          th.push(index_column.name)
        end
        th
      end

      def lead_body(object)
        td = []
        @index_columns.each do |column|
          td.push(object[column.table_attribute])
        end
        td
      end
  end
end
