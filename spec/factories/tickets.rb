FactoryBot.define do
  factory :ticket do
    name { "Fake Ticket Name" }
    phone { "123-456-7891" }
    region_id { "Fake Region ID" }
    resource_category_id { "Fake Resource Category ID" }
  end
end