class TimeSlot < ActiveRecord::Base
	has_many :guests

	validates :slot, presence: true, uniqueness: true
end
