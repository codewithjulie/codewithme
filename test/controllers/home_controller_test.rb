require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "codewithjulie"
  end

  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "codewithjulie"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Who is Julie?"
  end

  test "should get contact" do
    get new_contact_path
    assert_response :success
    assert_select "title", "Contact Me"
  end
end
