require "application_system_test_case"

class PostAttributesTest < ApplicationSystemTestCase
  setup do
    @post_attribute = post_attributes(:one)
  end

  test "visiting the index" do
    visit post_attributes_url
    assert_selector "h1", text: "Post Attributes"
  end

  test "creating a Post attribute" do
    visit post_attributes_url
    click_on "New Post Attribute"

    fill_in "Attribute name", with: @post_attribute.attribute_name
    fill_in "Attribute value", with: @post_attribute.attribute_value
    fill_in "Post", with: @post_attribute.post_id
    click_on "Create Post attribute"

    assert_text "Post attribute was successfully created"
    click_on "Back"
  end

  test "updating a Post attribute" do
    visit post_attributes_url
    click_on "Edit", match: :first

    fill_in "Attribute name", with: @post_attribute.attribute_name
    fill_in "Attribute value", with: @post_attribute.attribute_value
    fill_in "Post", with: @post_attribute.post_id
    click_on "Update Post attribute"

    assert_text "Post attribute was successfully updated"
    click_on "Back"
  end

  test "destroying a Post attribute" do
    visit post_attributes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post attribute was successfully destroyed"
  end
end
