class ShortlistedActivitiesController < ApplicationController
  def show
    @shortlisted_activity = ShortlistedActivity.find(params[:id])
    @activity = Activity.find(@shortlisted_activity.activity_id)
    @trip = Trip.find(params[:trip_id])

    @activity_map = Activity.geocoded
    @activity_geocoded = @activity_map.find(params[:id])
    @markers =
    [
      {
        lat: @activity_geocoded.latitude,
        lng: @activity_geocoded.longitude
      }
    ]
    @review = Review.new
    authorize @activity
  end
end
