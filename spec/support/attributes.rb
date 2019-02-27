def user1_attributes(overrides = {})
  {
  first_name: "Joe",
  last_name: "Mama",
  email: "joe@mail.com",
  password: "password",
  password_confirmation: "password"
  }.merge(overrides)
end

def user2_attributes(overrides = {})
  {
  first_name: "Jan",
  last_name: "Jama",
  email: "jan@mail.com",
  password: "password",
  password_confirmation: "password"
  }.merge(overrides)
end

def exercise1(overrides = {})
  {
    duration_in_min: 30,
    workout: "breathing hard",
    workout_date: 3.days.ago
  }.merge(overrides)
end

def exercise2(overrides = {})
  {
    duration_in_min: 30,
    workout: "cramping up",
    workout_date: Date.today
  }.merge(overrides)
end

def old_exercise(overrides = {})
  {
    duration_in_min: 25,
    workout: "sweating profusely",
    workout_date: 8.days.ago
  }.merge(overrides)
end
