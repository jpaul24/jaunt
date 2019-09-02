class ShortlistedActivitiesController < ApplicationController
  def show
    @activity = ShortlistedActivity.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    authorize @activity
  end

end
