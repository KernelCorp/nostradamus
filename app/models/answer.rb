class Answer
  include Mongoid::Document
  field :value, type: Mongoid::Boolean

  embedded_in :question

  belongs_to :user

  validates_uniqueness_of :user, scope: :question
end
