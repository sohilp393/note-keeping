 
# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    name	{ Faker::Name.name }
    email	{ Faker::Internet.email }
    password { Faker::Internet.password }
  end
end