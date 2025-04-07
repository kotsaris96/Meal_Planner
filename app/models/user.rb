class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api

  has_many :user_day_meals
  has_many :days, through: :user_day_meals
  has_many :meals, through: :user_day_meals

  has_many :user_meal_likes
  has_many :liked_meals, through: :user_meal_likes, source: :meal
end
