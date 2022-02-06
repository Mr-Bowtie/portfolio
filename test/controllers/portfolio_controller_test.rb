require "test_helper"

class PortfolioControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get portfolio_display_url
    assert_response :success
  end
end
