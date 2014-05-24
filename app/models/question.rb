class Question
  include Mongoid::Document
  field :title, type: String
  field :text, type: String
  field :end_date, type: Time
  field :start_date, type: Time
end
