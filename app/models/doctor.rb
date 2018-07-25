class Doctor < ApplicationRecord
	
	#Database Association
	has_many :patients
	belongs_to :user
	
	
	#Match the code entered by the patient with the code of doctor
	scope :found_doctor?, ->(code_input){ find_by(code: code_input).present? ? true : false }
	scope :doctor_found, ->(code){ find_by_code(code) }
	
	def self.found_doctor?(code_input)
		find_by(code: code_input).present? ? true : false
	end

	

end
