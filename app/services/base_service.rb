# frozen_string_literal: true

module BaseService
  extend ActiveSupport::Concern
  class_methods do
    def perform(*args)
      new(*args).perform
    end
  end

  def relation_objects(object, target_table)
    case target_table
    when "lead"
      relation_objects = object.leads
    when "staff"
      relation_objects = object.staffs
    when "contract"
      relation_objects = object.contracts
    when "company"
      relation_objects = object.partners
    end
  end
end
