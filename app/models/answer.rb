class Answer
  include Mongoid::Document
  field :value, type: Mongoid::Boolean

  belongs_to :question

  belongs_to :user

  validates_uniqueness_of :user, scope: :question
end
