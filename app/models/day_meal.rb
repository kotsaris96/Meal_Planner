class DayMeal < ApplicationRecord
  self.table_name = "days_meals"
  belongs_to :day
  belongs_to :meal

  validate :meal_unique_for_day

  private

  def meal_unique_for_day
    if DayMeal.exists?(day_id: day_id, meal_id: meal_id)
      errors.add(:meal_id, "has already been assigned to this day")
    end
  end
end
