require 'rails_helper'

describe 'listing of categories', type: :feature do
  it 'is shown on the root page' do
    visit root_path
    expect(page).to have_text('Categories List')
  end

  it 'lists the category titles' do
    # BEGIN - NOTES FOR WHIT
    #   category = Category.create(title: 'thing')
    #   category = FactoryGirl.create(:category)
    # END - NOTES

    categories = FactoryGirl.create_list(:category, 5) # makes a list of 5

    visit categories_path
    expect(page).to have_text("the perfect category", count: 5)
    expect(page).to have_text("Total Categories: 5")
  end
end

describe 'creating a category', type: :feature do
  it 'has a link to the category form on the list page'

  it 'can create a category from the category form'

  it 'can only be created if your an admin'

  it 'blocks the page if your not an admin'
end

describe 'viewing a category', type: :feature do
  it 'has a link to view a category from the category list page'
  it 'displays a list of ideas associated to that category'
end

describe 'managing an existing category', type: :feature do
  it 'has a delete link'
  it 'can only be deleted by an admin'
  it 'cannot be deleted by a regular user'
end
