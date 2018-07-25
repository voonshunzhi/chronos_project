class Patient < ApplicationRecord
	
	#Database Association
	belongs_to :user
	belongs_to :doctor
	
	
end
