require 'test_helper'

class MicroBlogTest < ActiveSupport::TestCase

  def setup
    @micro_blog = MicroBlog.new(title: "My Post", content: "Inside my post...")
  end

  test "micro blog should be valid" do
    assert @micro_blog.valid?
  end

  test "title should be present" do
    @micro_blog.title = " "
    assert_not @micro_blog.valid?
  end

  test "body should be present" do
    @micro_blog.content = " "
    assert_not @micro_blog.valid?
  end

  test "title should be unique" do
    @micro_blog.save
    @micro_blog2 = MicroBlog.new(title: "My Post", content: "Inside another post...")
    assert_not @micro_blog2.valid?
  end

  test "body should be unique" do
    @micro_blog.save
    @micro_blog2 = MicroBlog.new(title: "My Other Post", content: "Inside my post...")
    assert_not @micro_blog2.valid?
  end

end