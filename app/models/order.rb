class Order < ActiveRecord::Base
	belongs_to :users
	
	default_scope -> { order('created_at ASC') }
	validates :user_id, presence: true
	validates :address, presence: true
	VALID_PHONE_REGEX = /(\d{10})/
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
	validates :surcharge, presence: true

	def origin
		o = User.where(:id => user_id).pluck(:address)
		o.shift.strip
	end

	def running
		driver_id != nil
	end

	def done
		receipt != nil
	end

	
	end
