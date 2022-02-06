FactoryBot.define do
  factory :ticket do
    name { "Fake Ticket Name" }
    phone { "123-456-7890" }
    region_id { "1" }
    resource_category_id { "1" }
  end
end