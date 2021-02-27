require 'test_helper'

class UpdateBlogTest < ActionDispatch::IntegrationTest
  test "should go to update form to update fields and update with valid inputs then goes to updated blog" do
    test_blog = Blog.new(title:"1234567891011", author:"123456", body:"this is a test for 20 characters")
    test_blog.save

    get new_blog_path(test_blog)
    assert_response :success
    
    patch blog_path(test_blog), params: { blog: { title:"999999999999999999", author:"98765432", body:"this is a minitest for 20 characters" } }
     
    test_blog.reload

    assert_equal(test_blog.title, "999999999999999999")
    assert_equal(test_blog.author, "98765432")
    assert_equal(test_blog.body, "this is a minitest for 20 characters")
  end
end
