class MealSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :meal_type, :calories

  def meal_type
    object.meal_type.humanize
  end
end
