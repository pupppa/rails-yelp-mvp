class ReviewsController < ApplicationController

  def new
  # we need @restaurant in our `simple_form_for`
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurants_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

private

def review_params
params.require(:review).permit(:content, :rating)
end



end
