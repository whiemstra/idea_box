require 'rails_helper'

describe Category do
  let(:category) { Category.new }

  it 'has a title attribute' do
    expect(category).to respond_to(:title)
    expect(category).to respond_to(:title=)
  end

  it 'only is valid if title is present' do
    expect(category).to_not be_valid
    category.title = "a valid title"
    expect(category).to be_valid
  end

  it 'blocks saving if title is absent' do
    expect(category.save).to eql(false)
    category.title = 'another valid title'
    expect(category.save).to eql(true)
  end

  # Relationships

  it 'has many ideas' do
    expect(category).to respond_to(:ideas)

    category.ideas = FactoryGirl.create_list(:idea, 2)
    expect(category.ideas).to_not be_empty
  end

end
