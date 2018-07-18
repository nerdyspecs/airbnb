class User < ApplicationRecord
  include Clearance::User
  enum role: [:customer, :moderator, :admin]
  mount_uploader :image, AvatarUploader

  has_many :listings
  has_many :reservations
end
