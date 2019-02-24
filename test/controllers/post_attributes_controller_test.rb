require 'test_helper'

class PostAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_attribute = post_attributes(:one)
  end

  test "should get index" do
    get post_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_post_attribute_url
    assert_response :success
  end

  test "should create post_attribute" do
    assert_difference('PostAttribute.count') do
      post post_attributes_url, params: { post_attribute: { attribute_name: @post_attribute.attribute_name, attribute_value: @post_attribute.attribute_value, post_id: @post_attribute.post_id } }
    end

    assert_redirected_to post_attribute_url(PostAttribute.last)
  end

  test "should show post_attribute" do
    get post_attribute_url(@post_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_attribute_url(@post_attribute)
    assert_response :success
  end

  test "should update post_attribute" do
    patch post_attribute_url(@post_attribute), params: { post_attribute: { attribute_name: @post_attribute.attribute_name, attribute_value: @post_attribute.attribute_value, post_id: @post_attribute.post_id } }
    assert_redirected_to post_attribute_url(@post_attribute)
  end

  test "should destroy post_attribute" do
    assert_difference('PostAttribute.count', -1) do
      delete post_attribute_url(@post_attribute)
    end

    assert_redirected_to post_attributes_url
  end
end
