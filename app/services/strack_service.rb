# frozen_string_literal: true

class StrackService
  include BaseService

  def initialize(vendor_group:, ids:, table:, target_table:)
    @vendor_group = vendor_group
    case table
    when "company"
      @objects = Company.where(id: ids)
    when "contract"
      @objects = Contract.where(id: ids)
    end
    @target_table = target_table
  end

  def perform
    @objects.each do |object|
      @vendor_group.table_columns.where(data_type: "stacked", target_table: @target_table)&.each do |table_column|
        case table_column.stack_type
        when "count"
          count(object, table_column, @target_table)
        when "sum"
          sum(object, table_column, @target_table)
        when "min"
          min(object, table_column, @target_table)
        when "max"
          max(object, table_column, @target_table)
        end
        object.save!
      end
    end
  end

  def count(object, table_column, target_table)
    object[table_column.table_attribute] = relation_objects(object, target_table).count
  end

  def sum(object, table_column, target_table)
    object[table_column.table_attribute] = relation_objects(object, target_table).sum(table_column.target_column.table_attribute)
  end

  def min(object, table_column, target_table)
    # object[table_column.table_attribute] = relation_objects(object, target_table).pluck(table_column.target_column.table_attribute)&.min
    object[table_column.table_attribute] = relation_objects(object, target_table).minimum(table_column.target_column.table_attribute)
  end

  def max(object, table_column, target_table)
    # object[table_column.table_attribute] = relation_objects(object, target_table).pluck(table_column.target_column.table_attribute)&.max
    object[table_column.table_attribute] = relation_objects(object, target_table).maximum(table_column.target_column.table_attribute)
  end
end
