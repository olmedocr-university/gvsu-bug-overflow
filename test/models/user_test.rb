require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(lname: "Olmedo",
                        fname: "Raul",
                        email: "olmedocr@mail.gvsu.edu",
                        thumbnail: "/image.jpg")
    @empty_lname_user = User.new(lname: "",
                                    fname: "Raul",
                                    email: "olmedocr@mail.gvsu.edu",
                                    thumbnail: "/image.jpg")
    @empty_fname_user = User.new(lname: "Olmedo",
                                    fname: "",
                                    email: "olmedocr@mail.gvsu.edu",
                                    thumbnail: "/image.jpg")
    @empty_email_address = User.new(lname: "Olmedo",
                                       fname: "Raul",
                                       email: "",
                                       thumbnail: "/image.jpg")
    @invalid_email_address = User.new(lname: "Olmedo",
                                         fname: "Raul",
                                         email: "invalid",
                                         thumbnail: "/image.jpg")
    @invalid_thumbnail_extension = User.new(lname: "Olmedo",
                                               fname: "Raul",
                                               email: "olmedocr@mail.gvsu.edu",
                                               thumbnail: "/image.svg")
  end

  test "user must be valid" do
    assert @user.valid?
  end

  test "lname must be present while creating user" do
    assert_not @empty_lname_user.valid?
  end

  test "fname must be present while creating user" do
    assert_not @empty_fname_user.valid?
  end

  test "email must be present while creating user" do
    assert_not @empty_email_address.valid?
  end

  test "lname must be present while updating user" do
    assert_not @empty_lname_user.save
  end

  test "fname must be present while updating user" do
    assert_not @empty_fname_user.save
  end

  test "email must be present while updating user" do
    assert_not @empty_email_address.save
  end

  test "email must be valid" do
    assert_not @invalid_email_address.valid?
  end

  test "email must be unique" do
    @duplicated_user = @user
    assert_not @duplicated_user.save
  end

  test "thumbnail must end in .jpg, .png or .gif" do
    assert_not @invalid_thumbnail_extension.valid?
  end

end
