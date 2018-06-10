require 'test_helper'

class SubadminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subadmin = subadmins(:one)
  end

  test "should get index" do
    get subadmins_url
    assert_response :success
  end

  test "should get new" do
    get new_subadmin_url
    assert_response :success
  end

  test "should create subadmin" do
    assert_difference('Subadmin.count') do
      post subadmins_url, params: { subadmin: { email: @subadmin.email, name: @subadmin.name, subadmin_number: @subadmin.subadmin_number } }
    end

    assert_redirected_to subadmin_url(Subadmin.last)
  end

  test "should show subadmin" do
    get subadmin_url(@subadmin)
    assert_response :success
  end

  test "should get edit" do
    get edit_subadmin_url(@subadmin)
    assert_response :success
  end

  test "should update subadmin" do
    patch subadmin_url(@subadmin), params: { subadmin: { email: @subadmin.email, name: @subadmin.name, subadmin_number: @subadmin.subadmin_number } }
    assert_redirected_to subadmin_url(@subadmin)
  end

  test "should destroy subadmin" do
    assert_difference('Subadmin.count', -1) do
      delete subadmin_url(@subadmin)
    end

    assert_redirected_to subadmins_url
  end
end
