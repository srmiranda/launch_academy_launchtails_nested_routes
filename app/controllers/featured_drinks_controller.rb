class FeaturedDrinksController < ApplicationController
  def index
    @drinks = Drink.where(featured: true)
  end

  def destroy
    @drink = Drink.find params[:id]
    @drink.destroy
    flash[:notice] = 'Drink deleted.'
    redirect_to '/featured-drinks'
  end
end
