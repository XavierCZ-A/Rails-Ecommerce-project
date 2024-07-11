require "application_system_test_case"

class Sellers::ProductsTest < ApplicationSystemTestCase
  setup do
    @sellers_product = sellers_products(:one)
  end

  test "visiting the index" do
    visit sellers_products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit sellers_products_url
    click_on "New product"

    fill_in "Description", with: @sellers_product.description
    fill_in "Price", with: @sellers_product.price
    fill_in "Stock", with: @sellers_product.stock
    fill_in "Title", with: @sellers_product.title
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit sellers_product_url(@sellers_product)
    click_on "Edit this product", match: :first

    fill_in "Description", with: @sellers_product.description
    fill_in "Price", with: @sellers_product.price
    fill_in "Stock", with: @sellers_product.stock
    fill_in "Title", with: @sellers_product.title
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit sellers_product_url(@sellers_product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
