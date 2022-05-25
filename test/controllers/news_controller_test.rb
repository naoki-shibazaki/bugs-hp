require "test_helper"

class NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get bugsquest_news" do
    get news_bugsquest_news_url
    assert_response :success
  end
end