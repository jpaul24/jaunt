class Activity < ApplicationRecord
  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?
  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [:city],
    using: {
      tsearch: { prefix: true }
    }

  TOD = ["Morning", "Afternoon", "Evening"]

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :activity_categories, dependent: :destroy
  has_many :categories, through: :activity_categories, dependent: :destroy
  has_many :shortlisted_activities, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :tod, presence: true, inclusion: { in: TOD }
  validates :price, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

  before_validation :add_city_to_name

  def add_city_to_name
    self.name = "#{self.name}, #{self.city}"
  end

  def averagerating
    thisactivity = Activity.find(self.id)
    totalratings = []
    allreviews = thisactivity.reviews
    allreviews.each do |review|
      totalratings.push(review.rating.to_i)
    end
    avg = (totalratings.sum / allreviews.length)
    return avg
  end

end
