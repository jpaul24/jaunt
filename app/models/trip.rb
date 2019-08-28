class Trip < ApplicationRecord
  belongs_to :user
  has_many :shortlisted_activities

  validates :duration, presence: true
  validates :duration, numericality: true
  validates :trip_name, length: { in: 5..50 }, on: :update
  validates :description, length: { maximum: 500 }
  validates :likes, numericality: true
end
