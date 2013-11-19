FactoryGirl.define do
  factory :user do
    name "Example Last"
    password "Example password"
    password_confirmation "Example password"
    email "sample@example.com"

    factory :admin_user do
      admin true
    end
  end
end
