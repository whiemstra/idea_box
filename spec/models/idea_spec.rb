require 'rails_helper'

describe Idea do
  let(:idea) { FactoryGirl.build(:idea, category: category) }
  let(:category) { FactoryGirl.create(:category) }

  it 'has a description' do
    expect(idea).to respond_to(:description)
    expect(idea).to respond_to(:description=)
  end

  it 'must have a description to be valid' do
    idea.description = nil
    expect(idea).to_not be_valid
    idea.description = 'a valid description'
    expect(idea).to be_valid
  end

  it 'blocks a save if description is absent' do
    idea.description = nil
    expect(idea.save).to eql(false)
    idea.description = 'another valid description'
    expect(idea.save).to eql(true)
  end

  # Relationships

  it 'belongs to a category' do
    # Check I can assign it
    expect(idea).to respond_to(:category)
    expect(idea).to respond_to(:category=)

    # Use it now, and make sure category_id was set
    idea.category = category
    expect(idea.category_id).to eql(category.id)
  end

  it 'must belong to a category to be valid' do
    idea.category = nil
    expect(idea).to be_invalid
    idea.category = category
    expect(idea).to be_valid
  end

  # ---

  it 'belongs to a user'

  it 'must belong to a user to be valid'
end
