class GuestsController < ApplicationController
  def new
    @guest = Guest.new
    @times = TimeSlot.all
  end

  def create
  	params["guest"]["time_slot_id"].delete_if(&:blank?).each { |id|
      if Guest.new(guest_params).update_attributes(time_slot_id: id)
        flash[:success] = "Application successfully submitted."
      else
        flash[:error] = "There was an error with your application."
      end
    }
    redirect_to root_path
  end

  private
  def guest_params    
    params.require(:guest).permit(:name, :email, :phone, :description, :time_slot_id)
  end
end


