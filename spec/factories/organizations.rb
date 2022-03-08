FactoryBot.define do
  factory :organization do
    name { "Fake Organization Name" }
    status { "approved" }
    phone { "+15551234567" }
    email { "fake@example.com" }
    description { "Fake Description" }
    rejection_reason { "Fake Reason" }
    liability_insurance { "Fake Insurance" }
    primary_name { "Fake First Name" }
    secondary_name { "Fake Second Name" }
    secondary_phone { "+15555555432" }
    title { "Fake Title" }
    transportation { "yes" }

    factory :submitted do
      status { "submitted" }

      factory :approved do 
        sequence(:name) { |n| "name#{n}" }
        status { "approved" } 
        phone { "+15551234567" }
        sequence(:email) { |n| "person#{n}@email.com" }
        description { "Fake Description" }
        rejection_reason { "Fake Reason" }
        liability_insurance { "Fake Insurance" }
        primary_name { "Fake First Name" }
        secondary_name { "Fake Second Name" }
        secondary_phone { "+15555555432" }
        title { "Fake Title" }
        transportation { "yes" }
      end
    end
  end
end
