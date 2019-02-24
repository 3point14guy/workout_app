require 'rails_helper'

RSpec.feature "Listing Exercises" do
  before do
    @user = User.create(email: "mail@mail.com", password: "password")
    login_as(@user)

    @ex1 = @user.exercises.create(duration_in_min: 20,
                                  workout: "Body Building",
                                  workout_date: Date.today)

    @ex2 = @user.exercises.create(duration_in_min: 30,
                                  workout: "Swimming",
                                  workout_date: 2.day.ago)
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

    # expect(page).to have_content(@ex3.duration_in_min)
    # expect(page).to have_content(@ex3.workout)
    # expect(page).to have_content(@ex3.workout_date)
  end
end
