require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :address => "Address",
        :phone => "Phone",
        :surcharge => "9.99",
        :user_id => 1,
        :pay_type => false,
        :taken => false,
        :receipt => false,
        :done => false,
        :redeemed => false
      ),
      stub_model(Order,
        :address => "Address",
        :phone => "Phone",
        :surcharge => "9.99",
        :user_id => 1,
        :pay_type => false,
        :taken => false,
        :receipt => false,
        :done => false,
        :redeemed => false
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
