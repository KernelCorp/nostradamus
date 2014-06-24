class Event
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  TYPES = %w(close_question new_question)

  attr_accessor :is_new

  field :type, type: String

  belongs_to :question

end
