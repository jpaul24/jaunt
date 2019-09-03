module TripsHelper
  def check_photo(photo)
    if photo.nil?
      "default_activity.jpg"
    else
      photo
    end
  end

  def active_class(link_path)
    current_page?(link_path) ? "active-tab" : ""
  end
end
