require 'test_helper'

class UpdateCommentTest < ActionDispatch::IntegrationTest
  test "should go to update form to update fields and update with valid inputs then goes to comment list" do
    blog = blogs(:one)

    get new_blog_comment_path(blog)
    assert_response :success

    comment = blog.comments.build(content:"1234567891011", user:"123456")
    comment.save
    
    patch blog_comment_path(blog, comment), params: { comment: { content:"content123", user:"zam123" } }
    
    comment.reload
    blog.reload

    assert_equal(comment.content, "content123")
    assert_equal(comment.user, "zam123")
  end
end
