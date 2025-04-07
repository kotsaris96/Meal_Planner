# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require_relative 'seeds/user_seeder'
require_relative 'seeds/week_seeder'
require_relative 'seeds/meal_seeder'
require_relative 'seeds/day_meal_seeder'


Seeds::UserSeeder.create_admin_user
Seeds::WeekSeeder.populate_weeks
Seeds::MealSeeder.create_meals
Seeds::DayMealSeeder.assign_meals_to_days


