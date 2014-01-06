require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :phone => "Phone",
        :address => "Address",
        :email => "Email",
        :type => false,
        :latitude => 1.5,
        :longitude => 1.5
      ),
      stub_model(User,
        :name => "Name",
        :phone => "Phone",
        :address => "Address",
        :email => "Email",
        :type => false,
        :latitude => 1.5,
        :longitude => 1.5
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
