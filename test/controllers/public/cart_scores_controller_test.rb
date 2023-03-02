require "test_helper"

class Public::CartScoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cart_scores_index_url
    assert_response :success
  end
end
