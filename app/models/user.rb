class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :deliveries, foreign_key: "running_id", dependent: :destroy
  has_many :done, through: :deliveries, source: :done                                   
  has_many :running, through: :deliveries, source: :running

	validates :name, presence: true, length: { maximum: 50 }
	before_create :create_remember_token
	VALID_PHONE_REGEX = /(\d{10})/
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }, uniqueness: true
	validates :address, allow_blank: true, uniqueness: true
	has_secure_password
	validates :password, length: { minimum:6 }

  def running?(other_user)
    deliveries.find_by(running_id: other_user.id)
  end

  def run!(other_user)
    deliveries.create!(running_id: other_user.id)
  end

  def stop_run!(other_user)
    deliveries.find_by(running_id: other_user.id).destroy!
  end

  def feed
     #Order.from_users_running_by(self)
     Order.where("user_id = ?", id)
  end

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