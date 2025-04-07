class WeekSerializer < ActiveModel::Serializer
  attributes :id, :weekday_start, :weekday_end

  has_many :days, serializer: DaySerializer, unless: -> { instance_options[:exclude_days] }
end
