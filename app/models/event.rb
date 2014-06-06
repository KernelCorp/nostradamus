class Event
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  TYPES = %w(close_question new_question)

  attr_accessor :is_new

  field :type, type: String

  belongs_to :question

  def viewed_by!(user)
    @is_new = user.events_last_viewed_at < self.created_at
  end

end
