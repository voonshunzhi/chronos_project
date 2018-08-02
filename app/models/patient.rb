class Patient < ApplicationRecord
	
	#Database Association
	belongs_to :user
	belongs_to :doctor
	has_one :health_record
	before_save :check_level
	has_many :patient_prizes,:dependent => :destroy
	has_many :prizes,through: :patient_prizes

	def check_level
		if self.points>=200
			self.level = "level 5"
		elsif self.points >=160
			self.level = "level 4"
		elsif self.points >=130
			self.level = "level 3"
		elsif self.points >=100
			self.level = "level 2"
		elsif self.points >=70
			self.level = "level 1"
		elsif self.points >=40
		else self.level = "level basic"
		end
	end
end
