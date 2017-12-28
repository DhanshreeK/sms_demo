require 'test_helper'

class BulkSmsSettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bulk_sms_settings_new_url
    assert_response :success
  end

end
