class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @user_trips = user.trips
  end

  def show
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user
    @trip.likes = 0
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trips_path
  end

  def destroy
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
