require 'rails_helper'

RSpec.feature "Sign in" do
  before do
    @user = User.create!(email: 'name@email.com', password: 'secretest', password_confirmation: 'secretest')
  end
  scenario "with existing user" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password_confirmation
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@user.email}")
    expect(page).not_to have_link("Sign up")
    expect(page).not_to have_link("Sign in")
  end
end
