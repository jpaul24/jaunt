class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_activity, only: [:show, :destroy]

  def index
    if params[:place].present?
      @activities = policy_scope(Activity).where("city ILIKE ?", "%#{params[:place]}%")
    else
      @activities = policy_scope(Activity)
    end
  end

  def show
    authorize @activity
  end

  def create
    authorize @activity
  end

  def destroy
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
