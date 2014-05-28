class Category
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name,       type: String
  field :priority,   type: Integer, default: 0
  field :name_color, type: String,  default: '#888888'
  field :is_visible, type: Boolean, default: true

  has_many :new_questions

  has_mongoid_attached_file :image

  validates_attachment_content_type :image, content_type: %w(image/jpg image/jpeg image/png)

  accepts_nested_attributes_for :questions

  scope :visible, -> {where is_visible: true}

end
