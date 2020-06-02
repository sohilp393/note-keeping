# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryBot.define do
  factory :note do
    title { Faker::Name.name }
    body  { Faker::Lorem.sentences}
  end
end
