class Day < ApplicationRecord
  belongs_to :week
  has_and_belongs_to_many :meals, join_table: "days_meals"
  has_many :user_day_meals
  has_many :users, through: :user_day_meals
end
