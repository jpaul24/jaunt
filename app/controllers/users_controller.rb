class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def reviews
    @reviews = current_user.reviews
    authorize @reviews
  end

  def activities
    @activities = current_user.activities
    authorize @activities
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :first_name, :second_name, :nationality, :bio, :photo)
  end

end
