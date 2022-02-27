FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "fake#{n}@fake.com"}
    password { "Fake Secure Password" }
    password_confirmation { "Fake Secure Password" }
    role { "organization" }
  end

end