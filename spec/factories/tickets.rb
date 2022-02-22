FactoryBot.define do
  factory :ticket do
    name { 'Fake Ticket Name' }
    description { 'Fake Ticket Description' }
    phone { '+13035544321' }
    organization_id { create(:organization) }
    closed { false }
    closed_at { nil }
    resource_category { build_stubbed(:resource_category) }
    region { build_stubbed(:region) }
  end
end