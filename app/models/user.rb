class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	VALID_PHONE_REGEX = /(\d{10})/
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }, uniqueness: true
	validates :address, allow_blank: true, uniqueness: true
	has_secure_password
	validates :password, length: { minimum:6 }

end

