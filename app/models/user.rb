class User < ApplicationRecord
  validates :fname, :lname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105}, uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}

  validates :thumbnail, allow_blank: true, format: {with: %r{\.(gif|jpg|png)\Z}i,
                                                    message: 'must be a URL for GIF, JPG or PNG image.'}

  has_many :bugs

  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
    xml.instruct! unless options[:skip_instruct]
    xml.user do
      xml.tag!(:id, id)
      xml.tag!(:lname, lname)
      xml.tag!(:fname, fname)
      xml.tag!(:email, email)
      xml.tag!(:thumbnail, thumbnail)
      xml.tag!(:created_at, created_at)
      xml.tag!(:updated_at, updated_at)
    end

  end

end
