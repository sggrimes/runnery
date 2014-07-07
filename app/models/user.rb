class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_one :location, dependent: :destroy


	validates :name, presence: true, length: { maximum: 50 }
	VALID_PHONE_REGEX = /(\d{10})/
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }, 
            uniqueness: true, length: { maximum: 10 }
	validates :address, allow_blank: true, uniqueness: true
	has_secure_password
	validates :password, length: { minimum:6 }
  before_create :create_remember_token


  def restaurant_wait
     
     Order.where(:driver_id => nil)
          .where(:user_id => id)
     
  end

  def restaurant_run

     Order.where(:user_id => id)
     .where(:receipt => nil)
     .where("driver_id IS NOT ?", nil) 

  end

  def restaurant_done

     Order.where(:user_id => id)
          .where("receipt IS NOT ?", nil)
          .where("driver_id IS NOT ?", nil)
          .where("DATE(created_at) = DATE(?)", Time.now)
          
  end

  def restaurant_all_done

     Order.where(:user_id => id)
          .where("receipt IS NOT ?", nil)
          .where("driver_id IS NOT ?", nil)

  end


  def driver_wait
    lat = Location.where(:user_id => id).pluck(:lat)
    long = Location.where(:user_id => id).pluck(:lng)

    Order.where(:driver_id => nil)
         .near([lat.shift, long.shift], 2)

  end

  def driver_run

    Order.where(:receipt => nil)
         .where(:driver_id => id)
  
  end

  def driver_done

    Order.where("receipt IS NOT ?", nil)
         .where(:driver_id => id)
         .where("DATE(created_at) = DATE(?)", Time.now)
   
  end

  def driver_all_done

    Order.where("receipt IS NOT ?", nil)
         .where(:driver_id => id)
   
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