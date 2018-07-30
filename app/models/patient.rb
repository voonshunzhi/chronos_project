class Patient < ApplicationRecord
	
	#Database Association
	belongs_to :user
	belongs_to :doctor
	has_one :health_record
	# before_save :check_level

	# def check_level
	# 	if self.points>=1000
	# 		self.level = "level 5"
	# 	elsif self.points >=8000
	# 		self.level = "level 4"
	# 	elsif self.points >=6000
	# 		self.level = "level 3"
	# 	elsif self.points >=4000
	# 		self.level = "level 2"
	# 	elsif self.points >=2000
	# 		self.level = "level 1"
	# 	elsif self.points >=1000
	# 	else self.level = "level basic"
	# 	end
	# end
end
