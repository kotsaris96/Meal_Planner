class MealsController < ApplicationController
  before_action :set_meal, only: [ :edit, :update, :destroy, :show ]

  def index
    @meal = Meal.page(params[:page]).per(6)
    @user_liked_meals = user_signed_in? ? current_user.user_meal_likes.where(is_like: true).pluck(:meal_id) : []
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      assign_days_to_meal(@meal, params[:meal][:days])
      flash[:notice] = "Meal created successfully!"
      redirect_to meals_by_day_path(week_id: current_week&.id)
    else
      flash[:alert] = "Error creating meal."
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def show; end

  def update
    if @meal.update(meal_params)
      @meal.days.clear
      assign_days_to_meal(@meal, params[:meal][:days])
      redirect_to meals_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @meal.destroy
      redirect_to meals_path, notice: 'Meal was successfully destroyed.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def meals_by_day
      @week = Week.includes(days: :meals).find(params[:week_id])

      @next_week = Week.where("id > ?", @week.id).order(:id).first
      @prev_week = Week.where("id < ?", @week.id).order(id: :desc).first

      @user_liked_meals = user_signed_in? ? current_user.user_meal_likes.where(is_like: true).pluck(:meal_id) : []
    end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:title, :description, :meal_type, :calories)
  end

  def assign_days_to_meal(meal, selected_days)
    return unless selected_days.present?

    next_week = Date.today.next_week

    selected_days.each do |day_name|
      day_index = Date::DAYNAMES.index(day_name.capitalize)
      next unless day_index
      if day_name == 'Saturday' || day_name == 'Sunday'
        date = next_week.beginning_of_week + (day_index - 1)
      else
        date = Date.today.beginning_of_week + (day_index - 1)
      end

      formatted_date = date.strftime("%Y-%m-%d")
      day = Day.find_by(date: formatted_date)
      meal.days << day if day
    end
  end
end
