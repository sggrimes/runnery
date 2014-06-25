require 'spec_helper'

describe "Users" do
  
  	subject { page }

  	describe "User info page" do
  		let(:user) { FactoryGirl.create(:user) }
  		before { visit users_path(user) }

  		it { should have_content(user.name) }
      it { should have_content(user.phone) }
      it { should have_content(user.user_type) }
  		it { should have_title('User Info')}
  	end

  	describe "signup page" do
  		before { visit signup_path }

  		it { should have_content('Register!') }
  		it { should have_title(full_title('Register')) }
  	end
end
