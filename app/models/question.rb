class Question
  include Mongoid::Document
  include Mongoid::Paperclip

  field :title, type: String
  field :text, type: String
  field :end_date, type: Time
  field :start_date, type: Time
  field :right_answer, type: Mongoid::Boolean
  field :status, type: String

  embedded_in :category
  has_many :answers
  has_many :account_transactions

  has_mongoid_attached_file :image

  validates_attachment_content_type :image, content_type: %w(image/jpg image/jpeg image/png)

  def yield_outcome
    winning_answers = self.answers.where(value: self.right_answer)
    winning_value = (self.answers.count * 10 / winning_answers.count).to_i
    winning_answers.each do |answer|
      winning_user = answer.user
      transaction = AccountTransaction.create!(value: winning_value, user: winning_user, status: 'pending', action: 'win')
      transaction.execute_transaction
    end
  end

end
