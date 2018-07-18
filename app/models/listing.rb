class Listing < ApplicationRecord
	mount_uploaders :images, ImageUploader
	has_many :reservations
	belongs_to :user

	scope :check_title, -> (search){ where("title ILIKE ? OR city ILIKE ?", "%#{search}%","%#{search}%")}

	# Model.where("name LIKE ? OR last_name LIKE ? OR first_name LIKE ?", "%#{search}%","%#{search}%","%#{search}%")

end
