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
    if @review.save
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    elsif Review.where(activity: @review.activity).find_by(user: current_user)
      @review = Review.where(activity: @review.activity).find_by(user: current_user)
      @review.update(review_params)
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      render :new
    end
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
