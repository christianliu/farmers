class Guest < ActiveRecord::Base
	has_and_belongs_to_many :time_slots

	validates :name, :email, presence: true
end
