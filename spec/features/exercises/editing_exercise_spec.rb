require 'rails_helper'
require 'support/attributes'

RSpec.feature "Editing Exercise" do
  before do
    @owner = User.create!(user1_attributes)

    @owner_exercise = @owner.exercises.create!(exercise1)
    login_as(@owner)
  end

  scenario "with valid data succeeds" do
    visit "/"
    click_link "My Workouts"

    path = "/users/#{@owner.id}/exercises/#{@owner_exercise.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click

    fill_in "Duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(30)
  end
end
