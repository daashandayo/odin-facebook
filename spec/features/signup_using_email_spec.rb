require 'rails_helper'

RSpec.describe "Signup using email", type: :feature do

  scenario "When user accesses root page without being logged in redirect them to login page" do
    visit "/"
    expect(page).to have_text("Log in")
  end

  scenario "Signup if theres no account" do 
    visit "/"
    first(:link, "Sign up").click
    new_user  = FactoryBot.build(:user)
    fill_in 'Name', with: new_user.name
    fill_in 'Email', with: new_user.email
    fill_in 'Password', with: new_user.password
    fill_in 'Password confirmation', with: new_user.password
    click_button "Sign up"
    expect(page).to have_text("Welcome! You have signed up successfully.")
  end

end