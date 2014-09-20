class AddTimetoGuest < ActiveRecord::Migration
  def change
  	add_column :guests, :time_slot_id, :integer
  end
end
