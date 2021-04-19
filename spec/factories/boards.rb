FactoryBot.define do
  factory :board do
    related_object { "MyString" }
    related_object { "MyString" }
    related_object_id { 1 }
  end
end
