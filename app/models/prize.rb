class Prize < ApplicationRecord
	mount_uploader :image,AvatarUploader
	has_many :patients,through: :patient_prizes
	has_many :patient_prizes
end
