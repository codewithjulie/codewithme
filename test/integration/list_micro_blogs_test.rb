require "test_helper"

class ListMicroBlogsTest < ActionDispatch::IntegrationTest
  def setup
    @micro_blog = MicroBlog.create(title: "micro_blog One", content: "micro_blog One Body")
    @micro_blog2 = MicroBlog.create(title: "micro_blog Two", content: "micro_blog Two Body")
  end

  test "should show micro_blogs listing" do
    get micro_blogs_path
    assert_select "a[href=?]", micro_blog_path(@micro_blog), text: @micro_blog.title
    assert_select "a[href=?]", micro_blog_path(@micro_blog2), text: @micro_blog2.title
  end
end
