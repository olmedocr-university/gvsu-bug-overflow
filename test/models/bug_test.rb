require 'test_helper'

class BugTest < ActiveSupport::TestCase
  def setup
    @user = User.create(lname: "Olmedo",
                        fname: "Raul",
                        email: "olmedocr@mail.gvsu.edu",
                        thumbnail: "/image.jpg")
    @bug = Bug.create(title: "Bug title",
                      description: "This is the actual text of our article.  It can be rather long.",
                      user_id: @user.id)
  end

  test "bug must be valid" do
    assert @bug.valid?
  end

  test "title must be present" do
    @bug.title = ""
    assert_not @bug.valid?
  end

  test "description must be present while updating bug" do
    @bug.description = ""
    assert_not @bug.valid?
  end

  test "issue_type must be valid" do
    invalid_issue_types = [:open, :closed, :monitor]
    invalid_issue_types.each do |iit|
      begin
        @bug.issue_type = iit
        assert false, "#{iit} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "priority must be valid" do
    invalid_priorities = [:issue, :enhancement, :feature]
    invalid_priorities.each do |ip|
      begin
        @bug.priority = ip
        assert false, "#{ip} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "status must be valid" do
    invalid_statuses = [:low, :medium, :high]
    invalid_statuses.each do |is|
      begin
        @bug.status = is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "default value of issue_type should be feature" do
    assert @bug.issue_type.to_sym == :feature
  end

  test "default value of priority should be medium" do
    assert @bug.priority.to_sym == :medium
  end

  test "default value of status should be open" do
    assert @bug.status.to_sym == :open
  end
end
