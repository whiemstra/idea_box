require 'rails_helper'

describe 'signup', type: :feature do
  it 'has a link on the login page'
  it 'asks for a username and password'
  it 'errors if username or password are blank'
end

describe 'log in', type: :feature do
  it 'sends people to the login page if not logged in'
  it 'errors if username does not exist'
  it 'errors if username exists but password is wrong'
  it 'errors if username and password are blank'
end

describe 'log out', type: :feature do
  it 'only shows a link if logged in'
  it 'logs a user out when clicked'
  it 'does not allow people to access pages when logged out'
end
