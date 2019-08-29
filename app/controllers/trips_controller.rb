class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @user_trips = policy_scope(Trip)
  end

  def show
    @selected_time = params[:selected_time] || "Morning"
    @selected_day = params[:selected_day] || 1
    @trip.sort_activities
    @shortlisted_activities = @trip.shortlisted_activities.joins(:activity).where(
      day: @selected_day,
      activities: {
        tod: @selected_time
      })

    @activity = @shortlisted_activities.each { |shortlisted_activity| shortlisted_activity.activity }.join
    authorize @trip
  end

  def create
    activity_ids = params[:cardIds]
    # get all ids from params
    if activity_ids.nil?
      activity_array = []
    else
      activity_array = activity_ids.split(",").map(&:to_i).uniq
    end
    # convert it from a string to an array
    # iterate over this array

    # for each one of the ids create a shortlisted activity with the id of the trip you just created

    @trip = Trip.new
    @trip.user = current_user
    @trip.likes = 0
    @trip.duration = activity_array.size
    authorize @trip
    @trip.save
    activity_array.each do |activity|
      ShortlistedActivity.create(activity_id: activity, trip: @trip)
    end
    # create a trip
    redirect_to trips_path
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trips_path
    authorize @trip
  end

  def destroy
    authorize @trip
    @trip.destroy
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:trip_name, :description, :user_id)
  end
end
