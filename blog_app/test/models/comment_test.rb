require "test_helper"

class CommentTest < ActiveSupport::TestCase
  setup do
    @blog = blogs(:one)
  end
  test "should not save when user is less than 5 characters" do
    comment = @blog.comments.build(content:"123467", user:"123")
    assert_not comment.save
  end

  test "should not save when content is less than 5 characters" do
    comment = @blog.comments.build(content:"1", user:"123456")
    assert_not comment.save
  end

  test "should not save when content is missing" do
    comment = @blog.comments.build(content:"123456789")
    assert_not comment.save
  end

  test "Should save when everything is correct" do
    comment = @blog.comments.build(content:"1234567891011", user:"123456")
    assert comment.save
  end
end
