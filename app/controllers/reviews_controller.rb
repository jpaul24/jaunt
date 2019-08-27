class ReviewsController < ApplicationController
  def create
    authorize @review
    Review.new(review_params)
  end

  def edit
  end

  def update
    authorize @review
  end

  def destroy
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:activity_id, :user_id, :rating)
  end
end
