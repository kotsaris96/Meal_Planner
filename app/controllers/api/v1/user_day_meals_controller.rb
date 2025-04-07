class Api::V1::UserDayMealsController < Api::V1::BaseController
  def create
    user_id = current_devise_api_user.id
    day_id = params[:day_id]
    meal_id = params[:meal_id]

    if DayMeal.exists?(day_id: day_id, meal_id: meal_id)
      if UserDayMeal.exists?(user_id: user_id, day_id: day_id, meal_id: meal_id)
        render json: { success: false, message: "Meal selection already exists for this user, day, and meal" }, status: :unprocessable_entity
      else
        user_day_meal = UserDayMeal.create(user_id: user_id, day_id: day_id, meal_id: meal_id, is_selected: true)

        if user_day_meal.persisted?
          render json: { success: true, message: "Meal selection created", data: user_day_meal }, status: :ok
        else
          render json: { success: false, message: "Failed to create meal selection", errors: user_day_meal.errors }, status: :unprocessable_entity
        end
      end
    else
      render json: { success: false, message: "Invalid meal for this day" }, status: :unprocessable_entity
    end
  end

  def destroy
    user_id = current_devise_api_user.id
    day_id = params[:day_id]

    user_day_meal = UserDayMeal.find_by(user_id: user_id, day_id: day_id)

    if user_day_meal
      user_day_meal.destroy
      render json: { success: true, message: "Meal selection deleted successfully" }, status: :ok
    else
      render json: { success: false, message: "Meal selection not found" }, status: :not_found
    end
  end
end
