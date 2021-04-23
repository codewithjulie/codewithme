require "test_helper"

class MicroBlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micro_blog = MicroBlog.create(title: "My Post", content: "Inside my post...")
    @admin_user = User.create(first_name: "Julie", last_name: "J", username: "admin", email: "admin@email.com", password: "password", password_confirmation: "password", admin: true)
  end

  test "should get index" do
    get micro_blogs_path
    assert_response :success
  end

  test "should not get new if not admin" do
    get new_micro_blog_url
    assert_redirected_to micro_blogs_path
  end

  test "should get new" do
    sign_in_user(@admin_user, "password")
    get new_micro_blog_path
    assert_response :success
  end

  test "should not create micro_blog if not admin" do
    assert_no_difference('MicroBlog.count') do
      post micro_blogs_url, params: { micro_blog: {title: "Title", content: "Content"}}
    end

    assert_redirected_to micro_blogs_path
  end

  test "should create micro_blog" do
    sign_in_user(@admin_user, "password")
    assert_difference('MicroBlog.count') do
      post micro_blogs_url, params: { micro_blog: {title: "Title", content: "Content"} }
    end

    assert_redirected_to micro_blog_url(MicroBlog.last)
  end

  test "should show micro_blog" do
    get micro_blog_url(@micro_blog)
    assert_response :success
  end

  test "should not get edit if not admin" do
    get edit_micro_blog_url(@micro_blog)
    assert_redirected_to micro_blogs_path
  end

  test "should get edit" do
    sign_in_user(@admin_user, "password")
    get edit_micro_blog_url(@micro_blog)
    assert_response :success
  end

  test "should not update micro_blog if not admin" do
    patch micro_blog_url(@micro_blog), params: { micro_blog: {title: "Title", content: "Content"} }
    assert_redirected_to micro_blogs_path
  end

  test "should update micro_blog" do
    sign_in_user(@admin_user, "password")
    patch micro_blog_url(@micro_blog), params: { micro_blog: {title: "Title", content: "Content"} }
    assert_redirected_to micro_blog_url(@micro_blog)
  end

  test "should not destroy micro_blog if not admin" do
    assert_no_difference('MicroBlog.count') do
      delete micro_blog_url(@micro_blog)
    end
    assert_redirected_to micro_blogs_url
  end

  test "should destroy micro_blog" do
    sign_in_user(@admin_user, "password")
    assert_difference('MicroBlog.count', -1) do
      delete micro_blog_url(@micro_blog)
    end

    assert_redirected_to micro_blogs_url
  end
end
