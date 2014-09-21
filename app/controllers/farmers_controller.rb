class FarmersController < ApplicationController
  def new
    @farmer = Farmer.new
  end

  def create
  	@farmer = Farmer.create(guest_params)
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
