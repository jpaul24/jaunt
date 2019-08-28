class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @user_trips = policy_scope(Trip)
  end

  def show
    authorize @trip
  end

  def create
    raise
    # get all ids from params
    # convert it from a string to an array
    # iterate over this array
    # create a trip
    # for each one of the ids create a shortlisted activity with the id of the trip you just created
    authorize @trip
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    @trip.likes = 0
    authorize @trip
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
