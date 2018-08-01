class Badge < ApplicationRecord
	mount_uploader :image, AvatarUploader
end
