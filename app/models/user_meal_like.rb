class UserMealLike < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :is_like, inclusion: { in: [true, false] }
  validates :user_id, uniqueness: { scope: :meal_id, message: "has already liked this meal" }
end
