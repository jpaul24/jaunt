module TripsHelper
  def check_photo(activity)
    if activity.photo.nil?
      "default_activity.jpg"
    else
      activity.photo
    end
  end

  def active_class(link_path)
    current_page?(link_path) ? "active-tab" : ""
  end
end
