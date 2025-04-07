class ApplicationController < ActionController::Base
  include MealsHelper
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    meals_by_day_path(week_id: current_week&.id)
  end
end
