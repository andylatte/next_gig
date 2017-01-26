require 'test_helper'

class Admin::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get admin_welcome_Index_url
    assert_response :success
  end

end
