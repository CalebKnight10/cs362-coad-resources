FactoryBot.define do
  # factory :ticket do
  #   name { "Fake Ticket Name" }
  #   phone { "+1-555-123-4567" }
  #   region_id { 1 }
  #   resource_category_id { 1 }
  #   description { "Fake Description" }
  # end
  factory :ticket do
    name { 'Fake Ticket Name' }
    description { 'Fake Ticket Description' }
    phone { "555-123-4567" }
    closed { false }
    end
  end