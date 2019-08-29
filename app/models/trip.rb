class Trip < ApplicationRecord
  belongs_to :user
  has_many :shortlisted_activities, dependent: :destroy
  has_many :activities, through: :shortlisted_activities
  validates :duration, presence: true
  validates :duration, numericality: true
  validates :trip_name, length: { in: 5..50 }, on: :update
  validates :description, length: { maximum: 500 }
  validates :likes, numericality: true

  def activities_hash
    trip_hash = Hash[trip_duration.map { |day| [day, { "Morning" => nil, "Afternoon" => nil, "Evening" => nil}] }]
    shortlisted_activities.each do |shortlisted_activity|
      if trip_hash[shortlisted_activity.day.to_i][shortlisted_activity.activity.tod].nil?
        trip_hash[shortlisted_activity.day.to_i][shortlisted_activity.activity.tod] = shortlisted_activity.activity.name
      end
    end
    trip_hash
  end

  def morning_activities
    morning = ShortlistedActivity.where(trip: self).joins(:activity).where(activities: {tod: 'Morning'})
    day_increment(morning)
  end

  def afternoon_activities
    afternoon = ShortlistedActivity.where(trip: self).joins(:activity).where(activities: {tod: 'Afternoon'})
    day_increment(afternoon)
  end

  def evening_activities
    evening = ShortlistedActivity.where(trip: self).joins(:activity).where(activities: {tod: 'Evening'})
    day_increment(evening)
  end

  def sort_activities
    morning_activities
    afternoon_activities
    evening_activities
  end

  def trip_duration
    (1..duration).to_a
  end

  def day_increment(activities)
    activities.each_with_index do |activity, i|
      if i < duration
        activity.day = i + 1
        activity.save
      else
        activity.day = duration
        activity.save
      end
    end
  end
end
