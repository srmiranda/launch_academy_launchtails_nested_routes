class AdminController < ApplicationController
  def new
    @admins = Admin.new
  end

  def edit
    binding.pry
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
    if @drink.update(drink_params)
      redirect_to @drink, notice: "Drink Successfully Updated!"
    else
      render :action => :edit
    end
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description, :category_id, :alcohol_level, :featured)
  end

end
