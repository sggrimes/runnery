class Delivery < ActiveRecord::Base
	 belongs_to :running, class_name: "User"
     belongs_to :done, class_name: "User"
     validates :running_id, presence: true
end
