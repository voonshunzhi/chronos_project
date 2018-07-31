class User < ApplicationRecord
  include Clearance::User

	has_one :patient
	has_one :doctor
	mount_uploader :avatar, AvatarUploader
	
	enum role: [:patient,:doctor,:admin]
end
