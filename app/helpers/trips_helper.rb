module TripsHelper
  def check_photo(activity)
    photo = activity.photo
    if @photo.nil?
      "default_activity.jpg"
    else
      photo
    end
  end
end
