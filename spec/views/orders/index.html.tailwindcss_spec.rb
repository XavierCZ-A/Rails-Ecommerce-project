require 'rails_helper'

RSpec.describe "seller/orders/index", type: :view do
  before(:each) do
    assign(:sellers_orders, [
      Seller::Order.create!(
        customer_email: "Customer Email",
        product_quantity: 2,
        total_price: "9.99",
        status: 3,
        shipping_address: "Shipping Address",
        customer_name: "Customer Name",
        customer_phone: "Customer Phone"
      ),
      Seller::Order.create!(
        customer_email: "Customer Email",
        product_quantity: 2,
        total_price: "9.99",
        status: 3,
        shipping_address: "Shipping Address",
        customer_name: "Customer Name",
        customer_phone: "Customer Phone"
      )
    ])
  end

  it "renders a list of sellers/orders" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Customer Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Shipping Address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Customer Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Customer Phone".to_s), count: 2
  end
end
