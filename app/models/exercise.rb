class Exercise < ApplicationRecord
  belongs_to :user

# to cover the fact that our form labels don't match out database labels, use alias_attribute
  alias_attribute :workout_details, :workout
  alias_attribute :activity_date,  :workout_date

  validates :duration_in_min, numericality: { greater_than: 0.0 }
  validates :activity_date, presence: true
  validates :workout_details, presence: true
end
