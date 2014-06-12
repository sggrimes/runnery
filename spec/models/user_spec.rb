require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Example User", phone: "8885551234", address: "Chicago, IL USA", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:phone) }
  it { should respond_to(:address) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "when phone number is not present" do 
  	before { @user.phone = " " }
  	it { should_not be_valid }
  end

  describe "when phone number is too long" do
  	before { @user.phone = "5" * 11}
  	it { should_not be_valid }
  end

  describe "when phone number is too short" do
  	before { @user.phone = "5" * 9 }
  	it { should_not be_valid }
  end

  describe "when phone format is invalid" do
  	it "should be invalid" do
  		phones = %w[123-435-4789 (123) 546-2524 
  				124 235 2352 235 532-2335 ph19435678]
		phones.each do |invalid_phone|
			@user.phone = invalid_phone
			expect(@user).not_to be_valid
		end
	end
  end

  describe "when phone format is valid" do
  	it "should be valid" do
  		phones = %w[1234567890]
  		phones.each do |valid_phone|
  			@user.phone = valid_phone
  			expect(@user).to be_valid
  		end
  	end
  end

  describe "when phone number is already taken" do 
  	before do
  		user_with_same_phone = @user.dup
  		user_with_same_phone.save
  	end

  	it { should_not be_valid }
  end


 it { should respond_to(:authenticate) }


 describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", phone: "1234567890",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
  	before { @user.password = @user.password_confirmation = "a" * 5 }
  	it { should be_invalid }
  end

  describe "return value of authenticate method" do
  	before { @user.save }
  	let(:found_user) { User.find_by(phone: @user.phone) }

  	describe "with valid password" do
  		it { should eq found_user.authenticate(@user.password) }
  	end

  	describe "with invalid password" do
  		let(:user_for_invalid_password) { found_user.authenticate("invalid") }

  		it { should_not eq user_for_invalid_password }
  		specify { expect(user_for_invalid_password).to be_false }
  	end
  end
end
