class Question
  include Mongoid::Document
  field :title, type: String
  field :text, type: String
  field :end_date, type: Time
  field :start_date, type: Time

  embedded_in :category
  embeds_many :answers

  has_mongoid_attached_file :image

  validates_attachment_content_type :image, content_type: %w(image/jpg image/jpeg image/png)
end
