	class DrinksController < ApplicationController
	  def new
	    @drink = Drink.new
	  end

	  def create
	    @drink = Drink.new(drink_params)
	    if @drink.save
	      flash[:notice] = 'Drink added.'
	      redirect_to '/drinks'
	    else
	      render :new
	    end
	  end

    def edit
	    @drink = drink
	  end

	  def update
	    @drink = drink
	    if @drink.update(drink_params)
	      flash[:notice] = 'drink edited'
	      redirect_to @drink
	    else
	      @drink.errors.full_messages.each do |error|
	        if flash[:notice]
	          flash[:notice] << ", #{error}"
	        else
	          flash[:notice] = error
	        end
	      end
	      render :edit
	    end
	  end

	  def index
	    if params[:category_id]
	      @category = Category.find(params[:category_id])
	      @drinks = Drink.where(category: @category)
	    else
	      @drinks = Drink.all
	    end
	  end

    protected

    def drink
      Drink.find(params[:id])
    end

    def drink_params
      params.require(:drink).permit(:name)
    end
  end
