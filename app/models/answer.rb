class Answer
  include Mongoid::Document
  field :value,    type: Mongoid::Boolean
  field :is_right, type: Mongoid::Boolean

  belongs_to :question
  belongs_to :user

  scope :right, -> {where is_right: true}
  scope :wrong, -> {where is_right: false}

  validates_uniqueness_of :user, scope: :question
end
