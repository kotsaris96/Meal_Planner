class Api::V1::UserMealLikesController < Api::V1::BaseController
  def create
    user_id = current_devise_api_user.id
    meal_id = params[:meal_id]

    existing_like = UserMealLike.find_by(user_id: user_id, meal_id: meal_id)

    if existing_like
      render json: { success: false, message: "You have already liked this meal.", data: existing_like }, status: :unprocessable_entity
    else

    user_meal_like = UserMealLike.create(user_id: user_id, meal_id: meal_id, is_like: true)

    if user_meal_like.persisted?
      render json: { success: true, message: "Meal successfully liked!", data: user_meal_like }, status: :ok
    else
      render json: { success: false, message: "Unable to like this meal. Please try again.", errors: user_meal_like.errors }, status: :unprocessable_entity
    end
    end
  end

  def destroy
    user_id = current_devise_api_user.id
    meal_id= params[:meal_id]

    user_meal_like = UserMealLike.find_by(user_id: user_id, meal_id: meal_id)

    if user_meal_like
      user_meal_like.destroy
      render json: { success: true, message: "Meal like removed successfully." }, status: :ok
    else
      render json: { success: false, message: "No like found for this meal." }, status: :not_found
    end
  end
end
