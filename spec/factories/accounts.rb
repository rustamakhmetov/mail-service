FactoryGirl.define do
  factory :account do
    name Faker::Name.name
    email Faker::Internet.email
    balance Faker::Number.decimal(2).to_f
    currency ["rub", "$"].sample
  end
end
