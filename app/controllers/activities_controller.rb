class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    if params[:place].present?
      place = params[:place].split.first
      @activities = Activity.search_by_city(place).near(place, 40)
    elsif
      params.dig(:filter, :place).present?
      filter = params[:filter]
      place = filter[:place].split.first
      @activities = Activity.search_by_city(place)
    else
      @activities = policy_scope(Activity)
    end

    if params.dig(:filter, :categories).present?
      filter = params[:filter]
      @activities = @activities.joins(:categories).where(categories: { id: filter[:categories].reject(&:empty?).map(&:to_i) })
    end

    if params[:cardIds]
      activity_ids = params[:cardIds].split(',').uniq.map(&:to_i)
      @activities = @activities.reject { |activity| activity_ids.include?(activity.id) }
    end
  end

  def show
    @activity = Activity.find(params[:id])
    if @activity.geocoded?
      @markers = [
        {
          lat: @activity.latitude,
          lng: @activity.longitude
        }
      ]
    end
    authorize @activity
    raise
  end

  def edit
  end

  def new
    authorize @activity
    @activity = Activity.new
  end

  def create
    authorize @activity
    @activity = Activity.new(activity_params)
  end

  def update
    @activity.update(activity_params)
  end

  def destroy
    @activity.destroy
    authorize @activity
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :rating, :description, :city, :tod, :price, :user_id, :photo)
  end
end
