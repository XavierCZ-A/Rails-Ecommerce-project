require 'rails_helper'

RSpec.describe "sellers/orders/new", type: :view do
  before(:each) do
    assign(:sellers_order, Seller::Order.new(
      customer_email: "MyString",
      product_quantity: 1,
      total_price: "9.99",
      status: 1,
      shipping_address: "MyString",
      customer_name: "MyString",
      customer_phone: "MyString"
    ))
  end

  it "renders new sellers_order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "sellers_order[customer_email]"

      assert_select "input[name=?]", "sellers_order[product_quantity]"

      assert_select "input[name=?]", "sellers_order[total_price]"

      assert_select "input[name=?]", "sellers_order[status]"

      assert_select "input[name=?]", "sellers_order[shipping_address]"

      assert_select "input[name=?]", "sellers_order[customer_name]"

      assert_select "input[name=?]", "sellers_order[customer_phone]"
    end
  end
end
