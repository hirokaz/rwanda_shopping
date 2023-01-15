require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get items" do
    get items_path
    assert_response :success
  end
end
