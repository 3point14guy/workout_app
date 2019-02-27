require 'rails_helper'
require 'support/attributes'

RSpec.feature "Listing Exercises" do
  before do
    @user = User.create!(user1_attributes)
    login_as(@user)

    @ex1 = @user.exercises.create(exercise1)

    @ex2 = @user.exercises.create(exercise2)

    @ex3 = @user.exercises.create!(old_exercise)
  end

  scenario "shows workouts for the last 7 days" do
    visit "/"
    click_link "My Workouts"

    expect(page).to have_content(@ex1.duration_in_min)
    expect(page).to have_content(@ex1.workout)
    expect(page).to have_content(@ex1.workout_date)

    expect(page).to have_content(@ex2.duration_in_min)
    expect(page).to have_content(@ex2.workout)
    expect(page).to have_content(@ex2.workout_date)

    expect(page).not_to have_content(@ex3.duration_in_min)
    expect(page).not_to have_content(@ex3.workout)
    expect(page).not_to have_content(@ex3.workout_date)
  end
end
