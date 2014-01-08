require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :address => "MyString",
      :phone => "MyString",
      :surcharge => "9.99",
      :user_id => 1,
      :pay_type => false,
      :taken => false,
      :receipt => false,
      :done => false,
      :redeemed => false
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_path(@order), "post" do
      assert_select "input#order_address[name=?]", "order[address]"
      assert_select "input#order_phone[name=?]", "order[phone]"
      assert_select "input#order_surcharge[name=?]", "order[surcharge]"
      assert_select "input#order_user_id[name=?]", "order[user_id]"
      assert_select "input#order_pay_type[name=?]", "order[pay_type]"
      assert_select "input#order_taken[name=?]", "order[taken]"
      assert_select "input#order_receipt[name=?]", "order[receipt]"
      assert_select "input#order_done[name=?]", "order[done]"
      assert_select "input#order_redeemed[name=?]", "order[redeemed]"
    end
  end
end
