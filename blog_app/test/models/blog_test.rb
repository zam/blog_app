require "test_helper"

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save when title is less than 10 characters" do
    blog = Blog.new(title:"123456789", author:"12345", body:"this is a test for 20 characters")
    assert_not blog.save
  end

  test "should not save when body is less than 20 characters" do
    blog = Blog.new(title:"123456789", author:"12345", body:"not 20 char")
    assert_not blog.save
  end

  test "should not save when body is missing" do
    blog = Blog.new(title:"123456789", author:"12345")
    assert_not blog.save
  end

  test "Should save when everything is correct" do
    blog = Blog.new(title:"1234567891011", author:"123456", body:"this is a test for 20 characters")
    assert blog.save
  end
end
