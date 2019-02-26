require 'rails_helper'

RSpec.feature "Deleting Exercise" do
  before do
    @owner = User.create!(email: "mail@mail.com", password: "password")
    @owner_exercise = @owner.exercises.create!(duration_in_min: 24, workout: "chopping wood", workout_date: Date.today)
    login_as(@owner)
  end

  scenario "as an owner is successful" do
    visit "/"
    click_link "My Workouts"

    path = "/users/#{@owner.id}/exercises/#{@owner_exercise.id}/"
    link = "//a[contiains(@ref, \'#{path}\') and .//text()='Destroy']"
    find(:xpath, link).click

    expect(current_path).to eq(users_exercises_path(@owner))
    expect(page).to have_content("Exercise has been deleted")
    expect(page).not_to have_content("chopping wood")
  end
end
