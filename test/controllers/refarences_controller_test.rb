require 'test_helper'

class RefarencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @refarence = refarences(:one)
  end

  test "should get index" do
    get refarences_url
    assert_response :success
  end

  test "should get new" do
    get new_refarence_url
    assert_response :success
  end

  test "should create refarence" do
    assert_difference('Refarence.count') do
      post refarences_url, params: { refarence: { name: @refarence.name } }
    end

    assert_redirected_to refarence_url(Refarence.last)
  end

  test "should show refarence" do
    get refarence_url(@refarence)
    assert_response :success
  end

  test "should get edit" do
    get edit_refarence_url(@refarence)
    assert_response :success
  end

  test "should update refarence" do
    patch refarence_url(@refarence), params: { refarence: { name: @refarence.name } }
    assert_redirected_to refarence_url(@refarence)
  end

  test "should destroy refarence" do
    assert_difference('Refarence.count', -1) do
      delete refarence_url(@refarence)
    end

    assert_redirected_to refarences_url
  end
end
