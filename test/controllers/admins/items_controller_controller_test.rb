require "test_helper"

class Admins::ItemsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_items_path
    assert_response :error
  end
end
