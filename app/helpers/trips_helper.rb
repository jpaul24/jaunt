module TripsHelper
  def check_photo(activity)
    if activity.nil?
      "default_activity.jpg"
    else
      activity
    end
  end

  def tod_icon_picker(activity)
    if activity.activity.tod == "Morning"
      "sunrise.png"
    elsif activity.activity.tod == "Afternoon"
      "sun.png"
    elsif activity.activity.tod == "Evening"
      "sunset.png"
    end
  end

  def tod_activity_picker(activities, day)
    activities = activities.where(day: day)
    morning = activities.find { |activity| activity.activity.tod == "Morning" }
    afternoon = activities.find { |activity| activity.activity.tod == "Afternoon" }
    evening = activities.find { |activity| activity.activity.tod == "Evening" }
    [morning, afternoon, evening]
  end
end
