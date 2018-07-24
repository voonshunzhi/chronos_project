class User < ApplicationRecord
	has_one :patient
	has_one :doctor
end
