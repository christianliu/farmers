class Guest < ActiveRecord::Base
	belongs_to :time_slot

	validates :name, :email, :time_slot_id, presence: true
end
