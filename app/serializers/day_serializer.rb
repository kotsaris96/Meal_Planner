class DaySerializer < ActiveModel::Serializer
  attributes :id, :name, :formatted_date

  has_many :meals, serializer: MealSerializer

  def formatted_date
    object.date.strftime("%d/%m/%Y") if object.date.present?
  end
end
