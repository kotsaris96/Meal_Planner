module Seeds
  class DayMealSeeder
    def self.assign_meals_to_days
      meal_ids = Meal.pluck(:id)
      day_ids = Day.pluck(:id)
      insert_values = []

      if meal_ids.empty? || day_ids.empty?
        puts "⚠️ No meals or days found. Skipping meal assignment."
        return
      end

      day_ids.each do |day_id|
        meals_for_day = meal_ids.sample(5)

        meals_for_day.each do |meal_id|
          insert_values << { day_id: day_id, meal_id: meal_id }
        end
      end

      DayMeal.insert_all(insert_values)
      puts "🎉 Successfully assigned meals to all days!"
    end
  end
end
