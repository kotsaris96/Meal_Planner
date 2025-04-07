module MealsHelper

  def current_week
    monday = Date.today - (Date.today.wday - 1)
    formatted_monday = monday.strftime("%d/%m/%Y")
    Week.where('weekday_start <= ?', formatted_monday).first
  end
end
