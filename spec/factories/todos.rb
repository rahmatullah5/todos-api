# frozen_string_literal: true

# spec/factories/todos.rb
FactoryBot.define do
  factory :todo do
    title { Faker::Games::Dota.hero }
  end
end
