class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	before_create :create_remember_token
	VALID_PHONE_REGEX = /(\d{10})/
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }, uniqueness: true
	validates :address, allow_blank: true, uniqueness: true
	has_secure_password
	validates :password, length: { minimum:6 }



 def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end