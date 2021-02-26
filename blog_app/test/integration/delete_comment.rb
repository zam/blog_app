require 'test_helper'

class DeleteCommentTest < ActionDispatch::IntegrationTest
  test "should delete a comment then redirect to index" do
    blog = blogs(:one)
    comment = blog.comments.build(content:"1234567891011", user:"123456")
    comment.save
    assert_difference "blog.comments.count", -1 do
      delete blog_comment_path(blog, comment)
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end
