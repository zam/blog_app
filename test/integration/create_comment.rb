require 'test_helper'

class CreateCommentTest < ActionDispatch::IntegrationTest
  test "should go to new comment form and create a new comment" do
    blog = blogs(:one)
    get new_blog_comment_path(blog)
    assert_response :success
    assert_difference 'blog.comments.count', 1 do
      post blog_comments_path, params: { comment: { user:"zam1234", content:"comment1" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end
