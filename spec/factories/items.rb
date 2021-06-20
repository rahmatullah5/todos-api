# frozen_string_literal: true

# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    name { Faker::Games::WorldOfWarcraft.hero }
    done false
    todo_id nil
  end
end
