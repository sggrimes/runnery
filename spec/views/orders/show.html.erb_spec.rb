require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :address => "Address",
      :phone => "Phone",
      :surcharge => "9.99",
      :user_id => 1,
      :pay_type => false,
      :taken => false,
      :receipt => false,
      :done => false,
      :redeemed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    rendered.should match(/Phone/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
