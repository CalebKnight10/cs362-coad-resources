FactoryBot.define do
  factory :region do
    sequence(:name) { |n| "Fake Region #{n}" }
  end
end