require 'test_helper'

class UnversityAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unversity_attachment = unversity_attachments(:one)
  end

  test "should get index" do
    get unversity_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_unversity_attachment_url
    assert_response :success
  end

  test "should create unversity_attachment" do
    assert_difference('UnversityAttachment.count') do
      post unversity_attachments_url, params: { unversity_attachment: { attachment: @unversity_attachment.attachment, university_id: @unversity_attachment.university_id } }
    end

    assert_redirected_to unversity_attachment_url(UnversityAttachment.last)
  end

  test "should show unversity_attachment" do
    get unversity_attachment_url(@unversity_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_unversity_attachment_url(@unversity_attachment)
    assert_response :success
  end

  test "should update unversity_attachment" do
    patch unversity_attachment_url(@unversity_attachment), params: { unversity_attachment: { attachment: @unversity_attachment.attachment, university_id: @unversity_attachment.university_id } }
    assert_redirected_to unversity_attachment_url(@unversity_attachment)
  end

  test "should destroy unversity_attachment" do
    assert_difference('UnversityAttachment.count', -1) do
      delete unversity_attachment_url(@unversity_attachment)
    end

    assert_redirected_to unversity_attachments_url
  end
end
