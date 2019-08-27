class Activity < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :activity_categories
  has_many :shortlisted_activities

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :city, presence: true
  validates :tod, presence: true, inclusion: { in: ["morning", "afternoon", "evening"] }
  validates :price, presence: true
end
