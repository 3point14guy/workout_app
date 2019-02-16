require 'rails_helper'

RSpec.feature "Sign Up" do
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "name@email.com"
    fill_in "Password", with: "secretest"
    fill_in "Password confirmation", with: "secretest"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end

  scenario "with invalid credentials"
end
