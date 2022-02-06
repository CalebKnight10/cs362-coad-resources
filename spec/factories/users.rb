FactoryBot.define do
  factory :user do
    email { "fake@example.com" }
    password { "Fake Secure Password" }
  end
end