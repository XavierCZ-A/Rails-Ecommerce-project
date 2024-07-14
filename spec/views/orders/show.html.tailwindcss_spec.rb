require 'rails_helper'

RSpec.describe "sellers/orders/show", type: :view do
  before(:each) do
    assign(:sellers_order, Seller::Order.create!(
      customer_email: "Customer Email",
      product_quantity: 2,
      total_price: "9.99",
      status: 3,
      shipping_address: "Shipping Address",
      customer_name: "Customer Name",
      customer_phone: "Customer Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Customer Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Shipping Address/)
    expect(rendered).to match(/Customer Name/)
    expect(rendered).to match(/Customer Phone/)
  end
end
