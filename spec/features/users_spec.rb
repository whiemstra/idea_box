require 'rails_helper'

describe 'signup', type: :feature do

  it 'has a link on the login page that links to a sign up form' do
    visit login_path
    expect(page).to have_link('Signup', new_user_path)

    click_link "Signup"
    expect(page).to have_text('Create a new account')

  end

  it 'asks for a username and password' do
    visit new_user_path
    expect(page).to have_text('Create a new account')

    fill_in "Username", with: "whitney"
    fill_in "Password", with: "pa$$word"
    click_button "Create Account"

    expect(page).to have_content("Categories List")
    expect(current_path).to eql(categories_path)
  end

  it 'errors if username or password are blank' do
    visit new_user_path
    expect(page).to have_text('Create a new account')

    click_button "Create Account"

    expect(page).to have_text('Create a new account')
    expect(page).to have_text('Username and Password cannot be blank')
  end


end

describe 'log in', type: :feature do
  #
  # it "can log in an existing user" do
  #   user = User.create(username: "whit", password: "hello123")
  #
  #   visit login_path
  #
  #   fill_in "Username", with: user.username
  #   fill_in "Password", with: "hello123"
  #   click_button "Login"
  #
  #   expect(page).to have_content("Welcome, whitney")
  #
  # end


  it 'sends people to the login page if not logged in'
  it 'redirects to the categories page after logging in'
  it 'errors if username does not exist'
  it 'errors if username exists but password is wrong'
  it 'errors if username and password are blank'
end

describe 'log out', type: :feature do


  # test "logged in user can log out" do
  #   user = User.create(username: "rachel", password: "password")
  #
  #   visit login_path
  #   fill_in "Username", with: user.username
  #   fill_in "Password", with: "password"
  #   click_button "Login"
  #
  #   assert page.has_content?("Welcome, rachel")
  #
  #   click_link "Logout"
  #
  #   refute page.has_content?("Welcome, rachel")
  # end


  it 'only shows a link if logged in'
  it 'logs a user out when clicked'
  it 'does not allow people to access pages when logged out'
end
