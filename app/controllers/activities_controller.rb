class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    activity_category = ActivityCategory.all

    if params[:place].present? || params.dig(:filter, :place).present?
      @activities = Activity.where("city ILIKE?", "%#{params[:place]}%")
    else
      @activities = policy_scope(Activity)
    end

    if params.dig(:filter, :tod).present?
      filter = params[:filter]
      @activities = @activities.where("tod ILIKE?", "%#{filter[:tod]}%")
    end
    if params.dig(:filter, :categories).present?
      filter = params[:filter]
      @activities = Category.joins(:).where("categories ILIKE?", "%#{filter[:categories]}%")
    end
    # @activities = policy_scope(Activity)
    session[:trip_days] = params[:days].to_i || params.dig(:filter, :days)
  end

  def show
    authorize @activity
  end

  def edit
  end

  def new
  end

  def create
    authorize @activity
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
