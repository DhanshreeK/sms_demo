require 'test_helper'

class EmailSettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get email_settings_new_url
    assert_response :success
  end

end
