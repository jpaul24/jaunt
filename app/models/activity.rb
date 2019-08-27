class Activity < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :city
  end
  belongs_to :user
  has_many :reviews
  has_many :activity_categories
  has_many :shortlisted_activities, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :city, presence: true
  validates :tod, presence: true, inclusion: { in: ["Morning", "Afternoon", "Evening"] }
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end
