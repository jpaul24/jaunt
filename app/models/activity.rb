class Activity < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [:city],
    using: {
      tsearch: { prefix: true }
    }

  TOD = ["Morning", "Afternoon", "Evening"]

  belongs_to :user
  has_many :reviews
  has_many :activity_categories
  has_many :shortlisted_activities, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :city, presence: true
  validates :tod, presence: true, inclusion: { in: TOD }
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end
