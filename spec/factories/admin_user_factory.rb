FactoryGirl.define do
  factory :admin_user, class: User do
    name "#{Random.rand(1..1000)} Last"
    password "password"
    password_confirmation "password"
    email "sample@example.com"
    admin true
  end
end
