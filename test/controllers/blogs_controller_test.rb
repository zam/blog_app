require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should respond with HTTP code 200 when request goes to GET /blogs" do
    get blogs_path
    assert_response :success
  end

  test "should respond with redirect when a valid request goes to POST /blogs" do
    post blogs_path, params: { blog: { title:"1234567891234123", author:"123456", body:"this is a test for 20 characters" } }
    assert_response :redirect
  end

  test "should respond with render when an invalid request goes to POST /blogs" do
    post blogs_path, params: { blog: { title:"", author:"", body:"" } }
    assert_response :success
  end

  test "should respond with redirect when a valid request goes to PATCH /blogs" do
    test_blog = Blog.new(title:"1234567891011", author:"123456", body:"this is a test for 20 characters")
    test_blog.save
    patch blog_path(test_blog), params: { blog: { title:"999999999999999999", author:"98765432", body:"this is a minitest for 20 characters" } }
    assert_response :redirect
  end

  test "should not respond with redirect when an invalid request goes to PATCH /blogs" do
    test_blog = Blog.new(title:"1234567891011", author:"123456", body:"this is a test for 20 characters")
    test_blog.save
    patch blog_path(test_blog), params: { blog: { title:"", author:"", body:"" } }
    assert_response :success
  end

  test "should respond with redirect when a valid request goes to DELETE blogs" do
    test_blog = Blog.new(title:"1234567891011", author:"123456", body:"this is a test for 20 characters")
    test_blog.save
    delete blog_path(test_blog)
    assert_response :redirect
  end

  test "should respond with redirect when a valid request goes to GET blog" do
    test_blog = Blog.new(title:"1234567891011", author:"123456", body:"this is a test for 20 characters")
    test_blog.save
    get blog_path(test_blog)
    assert_response :success
  end

  test "should respond with success on new blog path" do
    get new_blog_path
    assert_response :success
  end

  test "should respond with success when a valid request goes to GET blogs/:id/edit" do
    test_blog = Blog.new(title:"1234567891011", author:"123456", body:"this is a test for 20 characters")
    test_blog.save
    get edit_blog_path(test_blog)
    assert_response :success
  end
end
