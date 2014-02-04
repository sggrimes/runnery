class Order < ActiveRecord::Base
	belongs_to :users
	
	default_scope -> { order('created_at ASC') }
	validates :user_id, presence: true
	validates :address, presence: true
	VALID_PHONE_REGEX = /(\d{10})/
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
	validates :surcharge, presence: true

	def running
		driver_id != nil
	end

	def done
		receipt != nil
	end

	#def self.rest_address(user)
		#user_ids = "SELECT user_id FROM orders
					#WHERE user_id = user.id"
		#where("id IN #{address_ids}) OR id = :user_id", user_id: user.id)
	#end
	end
