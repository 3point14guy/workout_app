require 'rails_helper'
require 'support/attributes'

RSpec.feature "Sign in" do
  before do
    @user = User.create!(user1_attributes)
  end
  scenario "with existing user" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@user.email}")
    expect(page).not_to have_link("Sign up")
    expect(page).not_to have_link("Sign in")
  end
end
