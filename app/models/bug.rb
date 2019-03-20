class Bug < ApplicationRecord
  enum issue_type: [:issue, :enhancement, :feature]
  enum priority: [:low, :medium, :high]
  enum status: [:open, :closed, :monitor]
  validates :title, :description, presence: true
  belongs_to :user

  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
    xml.instruct! unless options[:skip_instruct]
    xml.bug do
      xml.tag!(:id, id)
      xml.tag!(:title, title)
      xml.tag!(:description, description)
      xml.tag!(:issue_type, issue_type)
      xml.tag!(:priority, priority)
      xml.tag!(:status, status)
      xml.tag!(:created_at, created_at)
      xml.tag!(:updated_at, updated_at)
      xml.tag!(:user_id, user_id)
    end

  end
end
