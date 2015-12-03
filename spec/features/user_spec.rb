require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

describe  "Users", :type => :feature do

  it  "Create new user" do
    visit new_user_path
    fill_in 'user_email', :with => 'example@example.com'
    fill_in 'user_password', :with => '123123321321'
    fill_in 'user_password_confirmation', :with => '123123321321'
    click_button 'Create User'
    expect(page).to have_content 'Email'
  end

 #  it  "Login user" do
 #    user = FactoryGirl.create(:user)
 #    visit login_path
 #    fill_in 'email', :with => user.email
 #    fill_in 'password', :with => 'password'
 #    check 'remember'
 #    click_button 'Login'
 #    expect(page).to have_content 'Login successful'
 #    end

   it  "Login user" do
     user = FactoryGirl.create(:user)
     visit login_path
     fill_in 'email', :with => user.email
     fill_in 'password', :with => 'password'
     check 'remember'
     click_button 'Login'
     expect(page).to have_content 'Login successful'
     end

end