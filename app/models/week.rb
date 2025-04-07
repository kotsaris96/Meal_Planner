class Week < ApplicationRecord
  has_many :days, dependent: :destroy

  validates :weekday_start, presence: true
  validates :weekday_end, presence: true

end
