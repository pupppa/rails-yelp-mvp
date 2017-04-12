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
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save

    redirect_to restaurants_path

    #redirects to the parent restaurant (FAILED - 4)
    # assigns a newly created but unsaved review as @review (FAILED - 5)
    # re-renders the 'new' template (FAILED - 6)
  end

  def edit
    @review = Review.find(params[:id])
  end

private

def review_params
params.require(:review).permit(:content, :rating)
end



end
