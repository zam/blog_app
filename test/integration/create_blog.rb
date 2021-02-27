require 'test_helper'

class UpdateBlogTest < ActionDispatch::IntegrationTest
  test "should go to new blog form and create a new blog" do
    get new_blog_path
    assert_response :success
    assert_difference 'Blog.count', 1 do
      post blogs_path, params: { blog: { title:"999999999999999999", author:"98765432", body:"this is a minitest for 20 characters" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end
