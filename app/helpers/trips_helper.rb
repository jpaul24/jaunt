module TripsHelper
  def check_photo(photo)
    if photo.nil?
      "default_activity.jpg"
    else
      photo
    end
  end

  def tod_icon_picker(i)
    if i == 0
      "sunrise.png"
    elsif i == 1
      "sun.png"
    elsif i == 2
      "sunset.png"
    end
  end
end
