require 'test_helper'

class DeleteBlogTest < ActionDispatch::IntegrationTest
  test "should delete a blog then redirect to index" do
    test_blog = blogs(:one)
    assert_difference "Blog.count", -1 do
      delete blog_path(test_blog)
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end
