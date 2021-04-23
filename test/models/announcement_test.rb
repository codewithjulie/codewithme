require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase

  def setup
    @announcement = Announcement.new(title: "New Announcement", body: "Body of the announcement")
  end

  test "announcement should be valid" do
    assert @announcement.valid?
  end

  test "title should be present" do
    @announcement.title = " "
    assert_not @announcement.valid?
  end

  test "body should be present" do
    @announcement.body = " "
    assert_not @announcement.valid?
  end
end
