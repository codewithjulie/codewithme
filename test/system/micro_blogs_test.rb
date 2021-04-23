require "application_system_test_case"

class MicroBlogsTest < ApplicationSystemTestCase
  setup do
    @micro_blog = micro_blogs(:one)
  end

  test "visiting the index" do
    visit micro_blogs_url
    assert_selector "h1", text: "Micro Blogs"
  end

  test "creating a Micro blog" do
    visit micro_blogs_url
    click_on "New Micro Blog"

    click_on "Create Micro blog"

    assert_text "Micro blog was successfully created"
    click_on "Back"
  end

  test "updating a Micro blog" do
    visit micro_blogs_url
    click_on "Edit", match: :first

    click_on "Update Micro blog"

    assert_text "Micro blog was successfully updated"
    click_on "Back"
  end

  test "destroying a Micro blog" do
    visit micro_blogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Micro blog was successfully destroyed"
  end
end
