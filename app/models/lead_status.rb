class LeadStatus < ApplicationRecord
  belongs_to :maker_group
  belongs_to :product
end
