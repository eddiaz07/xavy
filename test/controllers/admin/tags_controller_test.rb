require 'test_helper'

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should display tags index" do
    get admin_tags_url
    assert_response :success
  end


  test "should create a tag" do
    get new_admin_tag_url
    assert_response :success

    assert_difference('Tag.count', 1) do
      post admin_tags_url, params: { tag: { title: 'Tag prueba'}}
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
  test "should edit a tag" do
    tag = tags(:one)
    get edit_admin_tag_url(tag.id)
    assert_response :success
    patch admin_tag_url(tag), params: { tag: { title: 'Tag prueba'} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    tag.reload

    assert tag.title, 'other'
  end
    test "should destroy a tag" do
    tag = activities(:one)
    assert_difference('Tag.count', -1) do
      delete admin_tag_url(tag)
    end
  end
end