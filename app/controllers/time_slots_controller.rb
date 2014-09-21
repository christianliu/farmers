class TimeSlotsController < ApplicationController
  def new
  	@slot = TimeSlot.new
  end

  def create
  	@slot = TimeSlot.create(timeslot_params)
  end

  def edit
  end

  private
  def timeslot_params    
    params.require(:time_slot).permit(:slot)
  end
end
