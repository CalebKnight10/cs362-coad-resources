FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "fake#{n}@fake.com"}
    password { "Fake Secure Password" }
    password_confirmation { "Fake Secure Password" }
    role { "organization" }

    factory :organization_user do
      sequence(:email) { |n| "fake#{n}@fake.com" }
      password { "Fake Secure Password" }
      role { "organization" }
      organization

      factory :admin_user do
        role { "admin" }
      end
    end
  end
end