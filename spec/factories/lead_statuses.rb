FactoryBot.define do
  factory :lead_status do
    maker_group { nil }
    name { "MyString" }
    product { nil }
    order { 1 }
    contract_type { 1 }
  end
end
