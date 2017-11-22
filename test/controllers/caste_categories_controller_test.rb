require 'test_helper'

class CasteCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caste_category = caste_categories(:one)
  end

  test "should get index" do
    get caste_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_caste_category_url
    assert_response :success
  end

  test "should create caste_category" do
    assert_difference('CasteCategory.count') do
      post caste_categories_url, params: { caste_category: { name: @caste_category.name } }
    end

    assert_redirected_to caste_category_url(CasteCategory.last)
  end

  test "should show caste_category" do
    get caste_category_url(@caste_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_caste_category_url(@caste_category)
    assert_response :success
  end

  test "should update caste_category" do
    patch caste_category_url(@caste_category), params: { caste_category: { name: @caste_category.name } }
    assert_redirected_to caste_category_url(@caste_category)
  end

  test "should destroy caste_category" do
    assert_difference('CasteCategory.count', -1) do
      delete caste_category_url(@caste_category)
    end

    assert_redirected_to caste_categories_url
  end
end
