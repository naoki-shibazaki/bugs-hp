require "test_helper"

class GameBugsquestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_bugsquest_index_url
    assert_response :success
  end
end
