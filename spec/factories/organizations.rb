FactoryBot.define do
  factory :organization do
    name { "Fake Organization Name" }
    status { "approved" }
    phone { "555-123-4567" }
    email { "fake@example.com" }
    description { "Fake Description" }
    rejection_reason { "Fake Reason" }
    liability_insurance { "Fake Insurance" }
    primary_name { "Fake First Name" }
    secondary_name { "Fake Second Name" }
    secondary_phone { "555-555-5432" }
    title { "Fake Title" }
    transportation { "yes" }

    factory :submitted do
      status { "submitted" }
    end
  end
end