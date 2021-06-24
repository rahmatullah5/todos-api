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
require 'rails_helper'

RSpec.describe Item, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:todo) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }

  let(:item) do
    create(:item)
  end

  describe 'Create' do
    it 'request with valid attributes and validations' do
      expect(item).to be_valid
      expect(Item.count).to eq 1
    end

    it 'is have valid attributes' do
      expect(item.name).is_a? String
      expect(item.done).is_a?(FalseClass || TrueClass)
      expect(item.todo.class).is_a? Todo
    end
  end

  describe 'Update' do
    it 'request with valid attributes and validations' do
      item.update(FactoryBot.attributes_for(:item))
      expect(item).to be_valid
    end
  end

  describe 'Delete' do
    it 'request with valid attributes and validations' do
      item.destroy
      expect(Item.count).to eq 0
    end
  end
end
