require 'rails_helper'
require 'support/attributes'

RSpec.feature "Deleting Exercise" do
  before do
    @owner = User.create!(user1_attributes)
    @owner_exercise = @owner.exercises.create!(exercise1)
    login_as(@owner)
  end

  scenario "as an owner is successful" do
    visit "/"
    click_link "My Workouts"

    path = "/users/#{@owner.id}/exercises/#{@owner_exercise.id}"
    link = "//a[contains(@href,\'#{path}\') and .//text()='Delete']"
    find(:xpath, link).click

    expect(current_path).to eq(user_exercises_path(@owner))
    expect(page).to have_content("Exercise has been deleted")
    expect(page).not_to have_content("chopping wood")
  end
end
