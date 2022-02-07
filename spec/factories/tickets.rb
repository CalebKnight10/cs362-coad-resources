FactoryBot.define do
  factory :ticket do
    name { "Fake Ticket Name" }
    phone { "555-123-4567" }
    region_id { 1 }
    resource_category_id { 1 }
  end
end