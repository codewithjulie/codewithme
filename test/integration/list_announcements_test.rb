require "test_helper"

class ListAnnouncementsTest < ActionDispatch::IntegrationTest

  def setup
    @announcement = Announcement.create(title: "Announcement One", body: "Announcement One Body")
    @announcement2 = Announcement.create(title: "Announcement Two", body: "Announcement Two Body")
  end

  test "should show announcements listing" do
    get announcements_path
    assert_select "a[href=?]", announcement_path(@announcement), text: @announcement.title
    assert_select "a[href=?]", announcement_path(@announcement2), text: @announcement2.title
  end
end
