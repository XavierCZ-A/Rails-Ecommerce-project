require "test_helper"

class SellersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:xavier)
    sign_in @user
  end

  test "should get home" do
    get seller_url
    assert_response :success
  end
end
