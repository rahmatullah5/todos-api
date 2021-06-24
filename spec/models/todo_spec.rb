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
require 'rails_helper'

RSpec.describe Todo, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:items).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }

  let(:todo) do
    create(:todo)
  end

  describe 'Create' do
    it 'request with valid attributes and validations' do
      expect(todo).to be_valid
      expect(Todo.count).to eq 1
    end

    it 'is have valid attributes' do
      expect(todo.title).is_a? String
    end
  end

  describe 'Update' do
    it 'request with valid attributes and validations' do
      todo.update(FactoryBot.attributes_for(:todo))
      expect(todo).to be_valid
    end
  end

  describe 'Delete' do
    it 'request with valid attributes and validations' do
      todo.items.create(name: FactoryBot.attributes_for(:item))
      expect(todo.items.count).to eq 1
      todo.destroy
      expect(Todo.count).to eq 0
      expect(Item.count).to eq 0
    end
  end
end
