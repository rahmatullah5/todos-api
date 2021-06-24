# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  done       :boolean
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  todo_id    :integer          not null
#
# Indexes
#
#  index_items_on_todo_id  (todo_id)
#
# Foreign Keys
#
#  todo_id  (todo_id => todos.id)
#
# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    association :todo
    name { Faker::Games::WorldOfWarcraft.hero }
    done { false }
  end
end
