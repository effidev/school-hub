# test for creating account

require 'spec_helper'
require 'rails_helper'

describe 'register test' do
  it 'should create new user account' do
    visit '/users/sign_up'
    email = 'example@test.com'
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => 'password_test'
    fill_in 'user_password_confirmation', :with => 'password_test'
    click_button('sign-up-id')
    expect(page).to have_content 'Logout'
  end
end

describe 'try to register account with short password' do
  it 'should not create the account' do
    visit new_user_registration_path
    email = 'example@test.com'
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => 'test'
    fill_in 'user_password_confirmation', :with => 'test'
    click_button('sign-up-id')
    expect(page).to have_content 'Password is too short'
  end
end

describe 'try to register account with different password' do
  it 'should not create the account' do
    visit new_user_registration_path
    email = 'example@test.com'
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => 'testtest'
    fill_in 'user_password_confirmation', :with => 'rootroot'
    click_button('sign-up-id')
    expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end
end
