class Guest < ActiveRecord::Base
	belongs_to :time_slot

	validates :name, :email, presence: true
end
