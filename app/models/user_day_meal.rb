class UserDayMeal < ApplicationRecord
  belongs_to :user
  belongs_to :day
  belongs_to :meal

  validates :is_selected, inclusion: { in: [ true, false ] }
  validates :user_id, uniqueness: { scope: [:day_id, :meal_id], message: "Meal already selected for this day" }, if: :is_selected?
  validate :cannot_select_multiple_meals_per_day, on: :create

end

private
def cannot_select_multiple_meals_per_day
  if is_selected && UserDayMeal.exists?(user_id: user_id, day_id: day_id, is_selected: true)
    errors.add(:base, "You have already selected a meal for this day.")
  end
end