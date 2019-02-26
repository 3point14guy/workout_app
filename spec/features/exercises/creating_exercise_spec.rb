require 'rails_helper'

RSpec.feature 'Creating Exercise' do
  before do
    @user = User.create!(email: "mail@mail.com", password: "password")
    login_as(@user)

    visit '/'
    click_link "My Workouts"
    click_link "New Workout"
    expect(page).to have_link("Back")
  end

  scenario 'with valid inputs' do

    fill_in "Duration", with: 30
    fill_in "Workout Details", with: "biking"
    fill_in "Workout Date", with: 3.days.ago
    click_button "Create Workout"

    expect(page).to have_content("Exercise has been created")

    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@user, exercise))
    expect(exercise.user_id).to eq(@user.id)
  end

  scenario 'with invalid inputs' do

    fill_in "Duration", with: ""
    fill_in "Workout Details", with: ""
    fill_in "Workout Date", with: ""
    click_button "Create Workout"


    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout details can't be blank")
    expect(page).to have_content("Activity date can't be blank")
  end
end
