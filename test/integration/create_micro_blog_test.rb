require "test_helper"

class CreateMicroBlogTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(first_name: "Julie", last_name: "J", username: "admin", email: "admin@email.com", password: "password", password_confirmation: "password", admin: true)
    sign_in_user(@admin_user, "password")
  end

  test "get new micro_blog form and create micro_blog" do
    get new_micro_blog_path
    assert_response :success
    assert_difference 'MicroBlog.count', 1 do
      post micro_blogs_path, params: { micro_blog: {title: "micro_blog Title", content: "micro_blog Body"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "micro_blog", response.body
  end

  test "get new micro_blog form and reject invalid micro_blog submission" do
    get new_micro_blog_path
    assert_response :success
    assert_no_difference 'MicroBlog.count' do
      post micro_blogs_path, params: { micro_blog: {title: " ", content: " "}}
    end
    assert_match "error", response.body
  end
end
