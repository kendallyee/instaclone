require "rails_helper"

RSpec.feature "New", :type => :feature do
  # happy path
  scenario "User creates a new account with valid details" do
    visit "/users/new"
    fill_in "user[first_name]", :with => "Bob"
    fill_in "user[last_name]", :with => "Smith"
    fill_in "user[email]", :with => "bobsmith@gmail.com"
    fill_in "user[password]", :with => "12345678"
    fill_in "user[password_confirmation]", :with => "12345678"
    click_button "Sign up"
    expect(page).to have_text("Logout")
  end
  # edgy path
  scenario "User creates a new account with invalid email" do
    visit "/users/new"
    fill_in "user[first_name]", :with => "Bob"
    fill_in "user[last_name]", :with => "Smith"
    fill_in "user[email]", :with => "Bob"
    fill_in "user[password]", :with => "111"
    fill_in "user[password_confirmation]", :with => "111"
    click_button "Sign up"
    expect(page).to have_text("Signup")
  end
end
