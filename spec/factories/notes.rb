# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :note do
    title { Faker::Name.name }
    body  { Faker::Lorem.sentences}
    user_id { Faker::Number.non_zero_digit }
  end
end