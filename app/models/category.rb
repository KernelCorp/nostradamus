class Category
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name, type: String

  embeds_many :questions

  has_mongoid_attached_file :image

  validates_attachment_content_type :image, content_type: %w(image/jpg image/jpeg image/png)

end
