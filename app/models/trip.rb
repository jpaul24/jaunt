class Trip < ApplicationRecord
  belongs_to :user
  has_many :shortlisted_activities, dependent: :destroy

  validates :duration, presence: true
  validates :duration, numericality: true
  validates :trip_name, length: { in: 5..50 }, on: :update
  validates :description, length: { maximum: 500 }
  validates :likes, numericality: true

  def activities_hash
    trip_hash = Hash[trip_duration.map { |day| [day, { "Morning" => nil, "Afternoon" => nil, "Evening" => nil}] }]
    shortlisted_activities.map { |shortlisted_activity| shortlisted_activity.activity }

  end

  def morning_activities
    ShortlistedActivity.where(trip: self).joins(:activity).where(activities: {tod: 'Morning'})
  end

  def afternoon_activities
    ShortlistedActivity.where(trip: self).joins(:activity).where(activities: {tod: 'Afternoon'})
  end

  def evening_activities
    ShortlistedActivity.where(trip: self).joins(:activity).where(activities: {tod: 'Evening'})
  end

  def trip_duration
    (1..duration).to_a
  end
end
