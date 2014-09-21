class FarmersController < ApplicationController
  def new
    @farmer = Farmer.new
  end

  def create
    farmer = Farmer.new(farmer_params)
    
    if farmer.save
      flash[:success] = "Application successfully submitted."
    else
      flash[:error] = "There was an error with your application."
    end
    redirect_to root_path
  end

  def index
  end

  def edit
  end

  private
  def farmer_params    
    params.require(:farmer).permit(:name, :email, :phone, :status, :description)
  end
end
