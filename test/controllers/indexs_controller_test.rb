require "test_helper"

class IndexsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get indexs_index_url
    assert_response :success
  end
end
