# frozen_string_literal: true

# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# spec/factories/todos.rb
FactoryBot.define do
  factory :todo do
    title { Faker::Games::Dota.hero }
  end
end
