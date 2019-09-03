class ShortlistedActivitiesController < ApplicationController
  def show
    @shortlisted_activity = ShortlistedActivity.find(params[:id])
    @activity = Activity.find(@shortlisted_activity.activity_id)
    @trip = Trip.find(params[:trip_id])

    # @activity_map = Activity.geocoded
    # @activity_geocoded = @activity_map.find(params[:id])
    @markers =
    [
      {
        lat: @shortlisted_activity.activity.latitude,
        lng: @shortlisted_activity.activity.longitude
      }
    ]
    @review = Review.new
    authorize @activity
  end
end
