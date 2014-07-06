class Order < ActiveRecord::Base
	belongs_to :users	

	default_scope -> { order('created_at ASC') }
	validates :user_id, presence: true
	validates :origin_address, presence: true
	validates :address, presence: true
	VALID_PHONE_REGEX = /(\d{10})/
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
	validates :surcharge, presence: true

	geocoded_by :address, latitude: :latitude, longitude: :longitude
	geocoded_by :origin_address, latitude: :origin_latitude, longitude: :origin_longitude
	
	after_validation :custom_geocode

	def custom_geocode
   		var = Geocoder.coordinates(self.address)
   		var2 = Geocoder.coordinates(self.origin_address)
   		if var && var2 
   		self.latitude = var.first
   		self.longitude = var.last
   		self.origin_latitude = var2.first
   		self.origin_longitude = var2.last
   	    end
	end
	
	
	def origin_address
		o = User.where(:id => user_id).pluck(:address)
		o.shift
	end

	def origin_phone
		a = User.where(:id => user_id).pluck(:phone)
		a.shift
	end

	def driver_name
		d = User.where(:id => driver_id).pluck(:name)
		d.shift
	end

	def driver_phone
		p = User.where(:id => driver_id).pluck(:phone)
		p.shift
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
