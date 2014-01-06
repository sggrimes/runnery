require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :phone => "MyString",
      :address => "MyString",
      :email => "MyString",
      :type => false,
      :latitude => 1.5,
      :longitude => 1.5
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_phone[name=?]", "user[phone]"
      assert_select "input#user_address[name=?]", "user[address]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_type[name=?]", "user[type]"
      assert_select "input#user_latitude[name=?]", "user[latitude]"
      assert_select "input#user_longitude[name=?]", "user[longitude]"
    end
  end
end
