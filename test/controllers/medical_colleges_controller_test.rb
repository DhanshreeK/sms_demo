require 'test_helper'

class MedicalCollegesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_college = medical_colleges(:one)
  end

  test "should get index" do
    get medical_colleges_url
    assert_response :success
  end

  test "should get new" do
    get new_medical_college_url
    assert_response :success
  end

  test "should create medical_college" do
    assert_difference('MedicalCollege.count') do
      post medical_colleges_url, params: { medical_college: { college_name: @medical_college.college_name, country_id: @medical_college.country_id } }
    end

    assert_redirected_to medical_college_url(MedicalCollege.last)
  end

  test "should show medical_college" do
    get medical_college_url(@medical_college)
    assert_response :success
  end

  test "should get edit" do
    get edit_medical_college_url(@medical_college)
    assert_response :success
  end

  test "should update medical_college" do
    patch medical_college_url(@medical_college), params: { medical_college: { college_name: @medical_college.college_name, country_id: @medical_college.country_id } }
    assert_redirected_to medical_college_url(@medical_college)
  end

  test "should destroy medical_college" do
    assert_difference('MedicalCollege.count', -1) do
      delete medical_college_url(@medical_college)
    end

    assert_redirected_to medical_colleges_url
  end
end
