class Api::V1::UserDayMealFilterAndSortService
  def self.selected_and_order_like_filter_for_meals(user, day_id, meals)
    return meals unless user.present?

    selected_meals = filter_selected_meals(user, day_id, meals)

    if selected_meals.exists?
      return selected_meals
    end
    ordered_liked_meals(user, meals)
  end

  def self.filter_selected_meals(user, day_id, meals)
    meals.joins(:user_day_meals).where(user_day_meals: { user_id: user.id, is_selected: true, day_id: day_id })
         .joins("LEFT JOIN user_meal_likes
              ON user_meal_likes.meal_id = meals.id
              AND user_meal_likes.user_id = #{user.id}")
         .select(:id, :title, :description, :meal_type, :calories, :is_selected, :is_like)
  end

  def self.ordered_liked_meals(user, meals)
    meals.joins("LEFT JOIN user_meal_likes
              ON user_meal_likes.meal_id = meals.id
              AND user_meal_likes.user_id = #{user.id}")
         .order(user_meal_likes: { is_like: :asc })
         .select(:id, :title, :description, :meal_type, :calories, :is_like)
  end
end