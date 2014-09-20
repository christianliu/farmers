class TimeSlot < ActiveRecord::Base
	has_and_belongs_to_many :guests

	validates :slot, presence: true, uniqueness: true
end
