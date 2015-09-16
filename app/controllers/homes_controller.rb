class HomesController < ApplicationController
  def index
    @drinks = Drink.where(featured: true)
  end
end
