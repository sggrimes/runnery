FactoryGirl.define do 
	factory :user do
		name "Samuel Grimes"
		phone "8885551234"
		address "Chicago, IL USA"
		password "foobar"
		password_confirmation "foobar"
	end
end