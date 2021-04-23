require "test_helper"

class CreateAnnouncementTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(first_name: "Julie", last_name: "J", username: "admin", email: "admin@email.com", password: "password", password_confirmation: "password", admin: true)
    sign_in_user(@admin_user, "password")
  end

  test "get new announcement form and create announcement" do
    get new_announcement_path
    assert_response :success
    assert_difference 'Announcement.count', 1 do
      post announcements_path, params: { announcement: {title: "Announcement Title", body: "Announcement Body"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Announcement", response.body
  end

  test "get new announcement form and reject invalid announcement submission" do
    get new_announcement_path
    assert_response :success
    assert_no_difference 'Announcement.count' do
      post announcements_path, params: { announcement: {title: " ", body: " "}}
    end
    assert_match "error", response.body
  end
end
