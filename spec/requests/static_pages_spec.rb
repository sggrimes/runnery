require 'spec_helper'

describe "Static pages" do

	subject { page }

  describe "Home page" do
  	before { visit root_path }

  	it { should have_content('Welcome') }
    it { should have_title(full_title('Home')) }
 
  end

  describe "Site info page" do
  	before { visit site_info_path }

    it { should have_title(full_title('Info')) }
    	
  end
end
