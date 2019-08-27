class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to :show
    else
      render :edit
    end
  end

  def reviews
    @reviews = current_user.reviews
  end

  def activities
    @activities = current_user.activities
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :first_name, :second_name, :nationality, :bio, :photo)
  end

end
