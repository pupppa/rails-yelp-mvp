class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])

  #  assigns the requested restaurant as @restaurant (FAILED - 1)

  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    # no need for app/views/tasks/destroy.html.erb
    redirect_to restaurants_path
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    # assigns a newly created but unsaved restaurant as @restaurant (FAILED - 2)
    #  re-renders the 'new' template (FAILED - 3)

    redirect_to restaurant_path(@restaurant)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
      # *Strong params*: You need to *whitelist* what can be updated by the user
      # Never trust user data!

      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
