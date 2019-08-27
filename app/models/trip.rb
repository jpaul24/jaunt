class Trip < ApplicationRecord
  belongs_to :user

  validates :duration, presence: true
  validates :duration, numericality: true
  validates :trip_name, length: { in: 5..50 }
  validates :description, length: { maximum: 500 }
  validates :likes, numericality: true
end
