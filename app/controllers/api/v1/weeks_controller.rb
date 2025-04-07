class Api::V1::WeeksController < Api::V1::BaseController
  def index
    weeks = Week.all
    render json: weeks, each_serializer: WeekSerializer, exclude_days: true
  end

  def show
    week = Week.includes(days: { meals: :user_day_meals }).find(params[:id])

    week_data = {
      id: week.id,
      weekday_start: week.weekday_start,
      weekday_end: week.weekday_end,
      days: week.days.map do |day|
        {
          id: day.id,
          name: day.name,
          formatted_date: day.date.strftime("%d/%m/%Y"),
          meals: filtered_meals(day.meals, day.id)
        }
      end
    }

    render json: week_data
  end

  private
  def filtered_meals(meals, day_id)
    Api::V1::UserDayMealFilterAndSortService
      .selected_and_order_like_filter_for_meals(current_devise_api_user, day_id, meals)
      .as_json(only: [ :id, :title, :description, :meal_type, :calories, :is_selected, :is_like ])
  end
end
