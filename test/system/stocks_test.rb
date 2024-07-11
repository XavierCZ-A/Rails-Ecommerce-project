require "application_system_test_case"

class Sellers::StocksTest < ApplicationSystemTestCase
  setup do
    @sellers_stock = sellers_stocks(:one)
  end

  test "visiting the index" do
    visit sellers_stocks_url
    assert_selector "h1", text: "Stocks"
  end

  test "should create stock" do
    visit sellers_stocks_url
    click_on "New stock"

    fill_in "Quantity", with: @sellers_stock.quantity
    click_on "Create Stock"

    assert_text "Stock was successfully created"
    click_on "Back"
  end

  test "should update Stock" do
    visit sellers_stock_url(@sellers_stock)
    click_on "Edit this stock", match: :first

    fill_in "Quantity", with: @sellers_stock.quantity
    click_on "Update Stock"

    assert_text "Stock was successfully updated"
    click_on "Back"
  end

  test "should destroy Stock" do
    visit sellers_stock_url(@sellers_stock)
    click_on "Destroy this stock", match: :first

    assert_text "Stock was successfully destroyed"
  end
end
