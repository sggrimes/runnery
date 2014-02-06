class Order < ActiveRecord::Base
	belongs_to :users
	
	default_scope -> { order('created_at ASC') }
	validates :user_id, presence: true
	validates :address, presence: true
	VALID_PHONE_REGEX = /(\d{10})/
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
	validates :surcharge, presence: true

	def origin_address
		o = User.where(:id => user_id).pluck(:address)
		o.shift.strip
	end

	def origin_phone
		a = User.where(:id => user_id).pluck(:phone)
		a.shift.strip
	end

	def driver_name
		d = User.where(:id => driver_id).pluck(:name)
		d.shift.strip
	end

	def driver_phone
		p = User.where(:id => driver_id).pluck(:phone)
		p.shift.strip
	end

	def running
		driver_id != nil
	end

	def done
		receipt != nil
	end

	def paid_card
		pay_type == false
	end

	def receipt?
		receipt == true
	end

	def redeemed?
		redeemed == true
	end
	
	end
