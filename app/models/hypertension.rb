class Hypertension < ApplicationRecord
	belongs_to :health_record
	
	def self.created_at(date)
		where(created_at: date.beginning_of_day..date.end_of_day)
	end
end
