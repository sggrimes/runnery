require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :phone => "Phone",
      :address => "Address",
      :email => "Email",
      :type => false,
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Phone/)
    rendered.should match(/Address/)
    rendered.should match(/Email/)
    rendered.should match(/false/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
