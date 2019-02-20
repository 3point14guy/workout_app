require 'rails_helper'

RSpec.feature 'Creating Exercise' do
  before do
    @user = User.create!(email: "mail@mail.com", password: "password")
    login_as(@user)
  end

  scenario 'with valid inputs' do
    visit '/'
    click_link "My Workouts"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 30
    fill_in "Workout Details", with: "biking"
    fill_in "Workout Date", with: "2019-01-26"
    click_button "Create Workout"

    expect(page).to have_content("Exercise has been created")

    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@user, exercise))
    expect(exercise.user_id).to eq(@user.id)
  end
end
