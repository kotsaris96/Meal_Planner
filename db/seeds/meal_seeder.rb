module Seeds
  class MealSeeder
    def self.create_meals
      meals = [
        { title: "Grilled Chicken Salad", description: "Fresh greens with grilled chicken, cherry tomatoes, and vinaigrette.", meal_type: 0, calories: 350 },
        { title: "Vegetable Stir Fry", description: "Mixed vegetables stir-fried with tofu in a soy-ginger sauce.", meal_type: 0, calories: 400 },
        { title: "Pasta Primavera", description: "Pasta with fresh vegetables and a light olive oil sauce.", meal_type: 0, calories: 450 },
        { title: "Avocado Toast", description: "Whole grain toast topped with mashed avocado and poached egg.", meal_type: 0, calories: 300 },
        { title: "Berry Smoothie Bowl", description: "A blend of mixed berries, banana, and yogurt, topped with granola.", meal_type: 0, calories: 320 },
        { title: "Chicken Caesar Salad", description: "Crisp romaine lettuce with grilled chicken, croutons, and Caesar dressing.", meal_type: 0, calories: 550 },
        { title: "Quinoa Salad", description: "Quinoa with roasted vegetables and lemon dressing.", meal_type: 0, calories: 400 },
        { title: "Beef Tacos", description: "Ground beef tacos with lettuce, cheese, and salsa.", meal_type: 0, calories: 600 },
        { title: "Grilled Salmon", description: "Grilled salmon served with steamed asparagus.", meal_type: 0, calories: 500 },
        { title: "Falafel Wrap", description: "Falafel balls wrapped in a pita with veggies and tahini sauce.", meal_type: 0, calories: 450 }
      ]

      Meal.create!(meals)
      puts "✅ Successfully created #{meals.size} meals!"
    end
  end
end
