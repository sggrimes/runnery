class Location < ActiveRecord::Base
	belongs_to :users

	validates :user_id, presence: true
	validates :lat, presence: true
	validates :long, presence: true

end
