require 'test_helper'

class CustomerEmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_email = customer_emails(:one)
  end

  test "should get index" do
    get customer_emails_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_email_url
    assert_response :success
  end

  test "should create customer_email" do
    assert_difference('CustomerEmail.count') do
      post customer_emails_url, params: { customer_email: { email: @customer_email.email } }
    end

    assert_redirected_to customer_email_url(CustomerEmail.last)
  end

  test "should show customer_email" do
    get customer_email_url(@customer_email)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_email_url(@customer_email)
    assert_response :success
  end

  test "should update customer_email" do
    patch customer_email_url(@customer_email), params: { customer_email: { email: @customer_email.email } }
    assert_redirected_to customer_email_url(@customer_email)
  end

  test "should destroy customer_email" do
    assert_difference('CustomerEmail.count', -1) do
      delete customer_email_url(@customer_email)
    end

    assert_redirected_to customer_emails_url
  end
end
