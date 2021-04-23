require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(first_name: "Bob", last_name: "Murray", username: "BobMurray", email: "bob@murray.com", password: "password", password_confirmation: "password")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "first_name should be present" do
    @user.first_name = " "
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = " "
    assert_not @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "password_confirmation should be present" do
    @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "username should be unique" do
    @user.save
    @user2 = User.new(first_name: "Bob", last_name: "Murray", username: "BobMurray", email: "bob@murray2.com", password: "password", password_confirmation: "password")
    assert_not @user2.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 26
    assert_not @user.valid?
  end

  test "username should not be too short" do
    @user.username = "aa"
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.save
    @user2 = User.new(first_name: "Bob", last_name: "Murray", username: "BobMurray2", email: "bob@murray.com", password: "password", password_confirmation: "password")
    assert_not @user2.valid?
  end
end