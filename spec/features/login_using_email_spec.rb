require 'rails_helper'

RSpec.describe "Signup using email", type: :feature do

  scenario "When user accesses root page without being logged in redirect them to login page" do
    visit "/"
    expect(page).to have_text("Log in")
  end

  scenario "Login using email" do 
    visit "/"
    new_user  = FactoryBot.create(:user)
    fill_in 'Email', with: new_user.email
    fill_in 'Password', with: new_user.password
    click_button "Log in"
    expect(page).to have_text("Signed in successfully.")
  end

end