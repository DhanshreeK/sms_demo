require 'test_helper'

class CentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @center = centers(:one)
  end

  test "should get index" do
    get centers_url
    assert_response :success
  end

  test "should get new" do
    get new_center_url
    assert_response :success
  end

  test "should create center" do
    assert_difference('Center.count') do
      post centers_url, params: { center: { address: @center.address, alternate_contact: @center.alternate_contact, center_code: @center.center_code, center_name: @center.center_name, center_starting_date: @center.center_starting_date, city: @center.city, contact: @center.contact, contact_person_name: @center.contact_person_name, pan_card_no: @center.pan_card_no, residential_address: @center.residential_address, state: @center.state } }
    end

    assert_redirected_to center_url(Center.last)
  end

  test "should show center" do
    get center_url(@center)
    assert_response :success
  end

  test "should get edit" do
    get edit_center_url(@center)
    assert_response :success
  end

  test "should update center" do
    patch center_url(@center), params: { center: { address: @center.address, alternate_contact: @center.alternate_contact, center_code: @center.center_code, center_name: @center.center_name, center_starting_date: @center.center_starting_date, city: @center.city, contact: @center.contact, contact_person_name: @center.contact_person_name, pan_card_no: @center.pan_card_no, residential_address: @center.residential_address, state: @center.state } }
    assert_redirected_to center_url(@center)
  end

  test "should destroy center" do
    assert_difference('Center.count', -1) do
      delete center_url(@center)
    end

    assert_redirected_to centers_url
  end
end
