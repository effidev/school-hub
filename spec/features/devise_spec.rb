# test for creating account

require 'spec_helper'
require 'rails_helper'

describe 'register test' do
  it 'should create new user account' do
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Test_username'
    fill_in 'user_last_name', with: 'test_lastname'
    fill_in 'user_email', :with => 'example@test.com'
    fill_in 'user_password', :with => 'password_test'
    fill_in 'user_password_confirmation', :with => 'password_test'
    click_button('sign-up-id')
    expect(page).to have_content 'Logout'
  end
end

describe 'try to register account with short password' do
  it 'should not create the account' do
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Test_username'
    fill_in 'user_last_name', with: 'test_lastname'
    fill_in 'user_email', :with => 'example@test.com'
    fill_in 'user_password', :with => 'test'
    fill_in 'user_password_confirmation', :with => 'test'
    click_button('sign-up-id')
    expect(page).to have_content 'too short'
  end
end

describe 'try to register account with different password' do
  it 'should not create the account' do
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Test_username'
    fill_in 'user_last_name', with: 'test_lastname'
    fill_in 'user_email', :with => 'example@test.com'
    fill_in 'user_password', :with => 'testtest'
    fill_in 'user_password_confirmation', :with => 'rootroot'
    click_button('sign-up-id')
    expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end
end

describe 'test firstname' do
  it 'should return error on firstname\'s length' do
    visit new_user_registration_path
    fill_in 'user_last_name', :with => 'test_lastname'
    fill_in 'user_email', :with => 'example@test.com'
    fill_in 'user_password', :with => 'testtest'
    fill_in 'user_password_confirmation', :with => 'rootroot'
    click_button('sign-up-id')
    expect(page).to have_content 'too short'
  end
end

describe 'test lastname' do
  it 'should return error on lastname\'s length' do
    visit new_user_registration_path
    fill_in 'user_first_name', :with => 'Test_username'
    fill_in 'user_email', :with => 'example@test.com'
    fill_in 'user_password', :with => 'testtest'
    fill_in 'user_password_confirmation', :with => 'rootroot'
    click_button('sign-up-id')
    expect(page).to have_content 'too short'
  end
end