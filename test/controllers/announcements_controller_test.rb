require "test_helper"

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announcement = Announcement.create(title: "New Announcement", body: "This is a new announcement that we are testing")
    @admin_user = User.create(first_name: "Julie", last_name: "J", username: "admin", email: "admin@email.com", password: "password", password_confirmation: "password", admin: true)
  end

  test "should get index" do
    get announcements_url
    assert_response :success
  end

  test "should get new" do
    sign_in_user(@admin_user, "password")
    get new_announcement_url
    assert_response :success
  end

  test "should not get new if not admin" do
    get new_announcement_url
    assert_redirected_to announcements_path
  end

  test "should create announcement" do
    sign_in_user(@admin_user, "password")
    assert_difference('Announcement.count') do
      post announcements_url, params: { announcement: {title: "Another Announcement", body: "More testing" } }
    end

    assert_redirected_to announcement_url(Announcement.last)
  end

  test "should not create announcement if not admin" do
    assert_no_difference('Announcement.count') do
      post announcements_url, params: { announcement: {title: "Another Announcement", body: "More testing" } }
    end

    assert_redirected_to announcements_path
  end

  test "should show announcement" do
    get announcement_url(@announcement)
    assert_response :success
  end

  test "should not get edit if not admin" do
    get edit_announcement_url(@announcement)
    assert_redirected_to announcements_path
  end

  test "should not update announcement if not admin" do
    patch announcement_url(@announcement), params: { announcement: {title: "Another Announcement", body: "More testing" } }
    assert_redirected_to announcements_path
  end

  test "should not destroy announcement if not admin" do
    assert_no_difference('Announcement.count') do
      delete announcement_url(@announcement)
    end

    assert_redirected_to announcements_path
  end

  test "should get edit" do
    sign_in_user(@admin_user, "password")
    get edit_announcement_url(@announcement)
    assert_response :success
  end

  test "should update announcement" do
    sign_in_user(@admin_user, "password")

    patch announcement_url(@announcement), params: { announcement: {title: "Another Announcement", body: "More testing" } }
    assert_redirected_to announcement_url(@announcement)
  end

  test "should destroy announcement" do
    sign_in_user(@admin_user, "password")

    assert_difference('Announcement.count', -1) do
      delete announcement_url(@announcement)
    end

    assert_redirected_to announcements_url
  end
end
