require 'test_helper'

class PoliciesControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy" do
    get policies_privacy_url
    assert_response :success
  end

end
