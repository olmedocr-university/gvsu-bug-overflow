require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(lname: "Olmedo",
                        fname: "Raul",
                        email: "olmedocr@mail.gvsu.edu",
                        thumbnail: "/image.jpg")
  end

  test "user must be valid" do
    assert @user.valid?
  end

  test "lname must be present" do
    @user.lname = ""
    assert_not @user.valid?
  end

  test "fname must be present" do
    @user.fname = ""
    assert_not @user.valid?
  end

  test "email must be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email must be valid" do
    @user.email = "invalidemail"
    assert_not @user.valid?
  end

  test "email must be unique" do
    @duplicated_user = User.create(lname: "Olmedo2",
                                   fname: "Raul2",
                                   email: "olmedocr@mail.gvsu.edu",
                                   thumbnail: "/image2.jpg")
    assert_not @duplicated_user.valid?
  end

  test "thumbnail must end in .jpg, .png or .gif" do
    @user.thumbnail = "image.svg"
    assert_not @user.valid?
  end

end
