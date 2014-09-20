class GuestController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
  	@guest = Guest.create(guest_params)
  end

  def index
  end

  def edit
  end

  private
  def guest_params    
    params.require(:guest).permit(:name, :email, :phone, :status, :description)
  end
end
