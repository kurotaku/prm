# frozen_string_literal: true

module ApplicationHelper
  def my_sort_link(search_object, attribute, text)
    sort_link(
      search_object,
      attribute,
      text,
      {},
      class: "sort-link", remote: false
    )
  end

  def index_column(table_name)
    @current_vendor_group.table_columns.where(table_type: table_name).where.not(index_page_position: nil).order(index_page_position: "ASC")
  end
end
