require 'rails_helper'

RSpec.feature "NavLinks", type: :feature do

  scenario 'when user is not logged in' do
    visit 'users/sign_in'
    expect(page).to have_link("Facebook Clone")
    expect(page).to have_link("Sign up")
    expect(page).to have_link("Login")
  end 

  scenario 'when user is logged in' do
    visit "/"
    new_user  = FactoryBot.create(:user)
    fill_in 'Email', with: new_user.email
    fill_in 'Password', with: new_user.password
    click_button "Log in"
    expect(page).to have_link("Edit Profile")
    expect(page).to have_link("All Users")
    expect(page).to have_link("Logout")
    expect(page).to have_link("Notification")
    expect(page).to have_link("Logged in as")
  end

end

