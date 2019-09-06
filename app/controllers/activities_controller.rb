class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    if params[:cardIds].nil? && session[:trips_params].present?
      params[:cardIds] = session[:trips_params]['cardIds']
    end
    if params[:days].nil? && session[:trips_params].present?
      params[:days] = session[:trips_params]['days']
    end
    if params[:place].present?
      place = params[:place].split.first
      @activities = Activity.search_by_city

    elsif
      params.dig(:filter, :place).present?
      filter = params[:filter]
      place = filter[:place].split.first
      @activities = Activity.search_by_city
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
    @place = @activity.city
    @activitytrips = ShortlistedActivity.where("activity_id = ?", @activity.id)
  end

  def edit
    authorize @activity
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to activities_user_path(@activity.user)
    else
      render :new
    end

    authorize @activity
  end

  def update
    authorize @activity
    @activity.update(activity_params)
    redirect_to activities_user_path(@activity.user)
  end

  def destroy
    @activity.destroy
    redirect_back(fallback_location: root_path)
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
