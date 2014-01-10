class Order < ActiveRecord::Base
	belongs_to :user

	default_scope -> { order('created_at ASC') }
	validates :user_id, presence: true
	validates :address, presence: true
	VALID_PHONE_REGEX = /(\d{10})/
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
	validates :surcharge, presence: true

 def self.from_users_running_by(user)
    running_user_ids = user.running_user_ids
    where("user_id IN (:running_user_ids) OR user_id = :user_id",
          running_user_ids: running_user_ids, user_id: user)
  end
end
