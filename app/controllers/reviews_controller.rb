class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @trip
    @review = Review.new(review_params)
    @review.user = current_user
    @review.activity = Activity.find(params[:activity_id])
    authorize @review
    @review.save

  end

  def edit
  end

  def update
    @review = Review.find(params[:id])
    authorize @review
    @review.update(review_params)
    redirect_to reviews_user_path(current_user)
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to reviews_user_path(current_user)
  end

  private

  def review_params
    params.require(:review).permit(:activity_id, :user_id, :rating)
  end
end
