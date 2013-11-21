FactoryGirl.define do
  factory :user do
    name "#{Random.rand(1..100000)} Last"
    password "Example password"
    password_confirmation "Example password"
    email "sample@example.com"
  end
end
