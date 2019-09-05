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

  def new
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.new
    authorize @activity
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.new(activity_params)
    if params[:index] == "0"
      @activity.tod = "Morning"
    elsif params[:index] == "1"
      @activity.tod = "Afternoon"
    elsif params[:index] == "2"
      @activity.tod = "Evening"
    end
    @activity.city = @trip.activities.first.city
    @activity.user = current_user
    @activity.save!
    @shortlisted_activity = ShortlistedActivity.new
    @shortlisted_activity.activity = @activity
    @shortlisted_activity.trip = @trip
    @shortlisted_activity.day = params[:day]

    if @shortlisted_activity.save!
      redirect_to trip_path(@trip)
    else
      render :new
    end

    authorize @shortlisted_activity
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :rating, :description, :city, :tod, :price, :user_id, :photo)
  end

  def shortlisted_activity_params
    params.require(:shortlisted_activity).permit(:day, :trip_id, :activity_id)
  end
end
