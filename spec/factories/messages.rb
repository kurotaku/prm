FactoryBot.define do
  factory :message do
    board { nil }
    user { nil }
    content { "MyText" }
  end
end
