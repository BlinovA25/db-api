require "test_helper"

class TokensControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get tokens_get_url
    assert_response :success
  end

  test "should get check" do
    get tokens_check_url
    assert_response :success
  end
end
