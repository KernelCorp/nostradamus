class Question
  include Mongoid::Document
  include Mongoid::Paperclip

  field :title, type: String
  field :text, type: String
  field :end_date, type: Time
  field :start_date, type: Time

  embedded_in :category
  has_many :answers
  has_many :account_transactions

  has_mongoid_attached_file :image

  validates_attachment_content_type :image, content_type: %w(image/jpg image/jpeg image/png)
end
