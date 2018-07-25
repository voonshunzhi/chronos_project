class User < ApplicationRecord
  include Clearance::User

	has_one :patient
	has_one :doctor
end
