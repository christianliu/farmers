class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
  	@guest = Guest.create(guest_params)
  end

  private
  def guest_params    
    params.require(:guest).permit(:name, :email, :phone, :description)
  end
end
