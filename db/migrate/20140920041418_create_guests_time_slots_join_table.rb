class CreateGuestsTimeSlotsJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :guests, :time_slots do |t|
	  t.integer :guest_id
	  t.integer :time_slots_id
	end
  end
end
