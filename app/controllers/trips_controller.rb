class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :like, :trip_map]
  skip_before_action :authenticate_user!, only: :create
  def index
    @user_trips = policy_scope(Trip)
  end

  def show
    @trip.sort_activities
    @shortlisted_activities = @trip.shortlisted_activities
    @review = Review.new
    authorize @trip
  end

  def create
    skip_authorization
    if user_signed_in?
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
      @trip.duration = params[:days].to_i
      @trip.trip_name = "My trip to #{params[:place]}"
      authorize @trip
      @trip.save
      activity_array.each do |activity|
        ShortlistedActivity.create(activity_id: activity, trip: @trip)
      end
      # create a trip
      @trip.trip_name = "My trip to #{@trip.activities.first.city}"
      @trip.save
      redirect_to trips_path
    else
      trips_params = {}
      trips_params[:days] = params[:days]
      trips_params[:cardIds] = params[:cardIds]
      session[:trips_params] = trips_params
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to new_user_session_path
    end
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
    redirect_to trips_path
  end

  def like
    @trip.likes += 1
    authorize @trip
    @trip.save
  end

  def trip_map
    all_activities = @trip.shortlisted_activities.joins(:activity)
    @activity_array = []
    all_activities.each do |shortlisted|
      @activity_array << Activity.find(shortlisted.activity_id)
    end

    @markers = @activity_array.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { activity: activity })
      }
    end
    authorize @trip
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:trip_name, :description, :user_id)
  end
end
