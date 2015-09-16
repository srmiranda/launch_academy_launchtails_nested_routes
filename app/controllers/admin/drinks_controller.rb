class Admin::DrinksController < ActionController::Base

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

	  protected

	  def drink
	    Drink.find(params[:id])
	  end

	  def drink_params
	    params.require(:drink).permit(:name)
	  end
	end
