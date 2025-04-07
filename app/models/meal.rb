class Meal < ApplicationRecord
  has_and_belongs_to_many :days, join_table: "days_meals"

  has_many :user_day_meals
  has_many :users, through: :user_day_meals

  has_many :user_meal_likes
  has_many :liking_users, through: :user_meal_likes, source: :user

  validates :title, uniqueness: { message: "This title has already been taken" }
  validates :title, :description, :calories, presence: true
  validates :calories, numericality: { greater_than_or_equal_to: 0 }
  
  enum :meal_type, [:lunch]
end
