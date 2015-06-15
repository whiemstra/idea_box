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
  it 'has a link to the category form on the list page' do
    visit categories_path
    expect(page).to have_link('New Category', href: new_category_path)
  end

  it 'can create a category from the category form' do
    visit new_category_path
    expect(page).to have_text('Create Category Form')

    fill_in('Title', with: 'brand-new category')
    click_on('Create')

    expect(current_path).to eql(categories_path)
    expect(page).to have_text('brand-new category')
    expect(page).to have_text('Total Categories: 1')
  end

  it 'errors if title field is not filled in' do
    visit new_category_path
    expect(page).to have_text('Create Category Form')

    click_on('Create')
    expect(page).to have_text('Create Category Form')
    expect(page).to have_text('Title must be filled in.')
  end

  it 'can only be created if your an admin'

  it 'blocks the page if your not an admin'
end

describe 'viewing a category', type: :feature do
  before :each do
    @category = FactoryGirl.create(:category, title: 'My Category')
    @category.ideas = FactoryGirl.create_list(:idea, 1, description: 'First Idea')
  end

  it 'has a link to view a category from the category list page' do
    visit categories_path
    expect(page).to have_link('My Category', href: category_path(@category))
  end

  it 'displays a list of ideas associated to that category' do
    visit category_path(@category)
    expect(page).to have_text('My Category')
    expect(page).to have_text('Total Ideas: 1')
    expect(page).to have_text('First Idea')
  end
end

describe 'managing an existing category', type: :feature do
  before :each do
    @category = FactoryGirl.create(:category, title: 'Category to delete')
  end

  it 'has a delete link and can be deleted' do
    visit category_path(@category)
    expect(page).to have_link('Delete', href: category_path(@category))

    click_link('Delete')

    expect(current_path).to eql(categories_path)
    expect(page).to have_no_text('Category to delete')
  end

  it 'can only be deleted by an admin'
  it 'cannot be deleted by a regular user'
end
