class Patient < ApplicationRecord
	
	#Database Association
	belongs_to :user
	belongs_to :doctor
	has_one :health_record
	
end
