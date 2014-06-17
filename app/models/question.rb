class Question
  include Mongoid::Document
  include Mongoid::Paperclip

  field :title,        type: String
  field :text,         type: String
  field :end_date,     type: DateTime
  field :start_date,   type: DateTime
  field :right_answer, type: Mongoid::Boolean
  field :status,       type: String

  belongs_to :category
  belongs_to :user

  has_many :answers
  has_many :account_transactions
  has_many :events

  has_mongoid_attached_file :image

  validates_attachment_content_type :image, content_type: %w(image/jpg image/jpeg image/png)

  scope :closed, -> {where status: 'closed'}

  def yield_outcome
    handle_right_answer!
    handle_wrong_answer!
  end

  def active?; !(self.status == 'closed') end

  def community_guessed?
    return false if self.answers.count == 0
    (self.answers.where(value: self.right_answer).count * 100 / self.answers.count) >= 50
  end

  private
    def handle_right_answer!
      winning_answers = self.answers.where(value: self.right_answer)
      if winning_answers.count > 0
        winning_value = (self.answers.count * 10 / winning_answers.count).to_i
        winning_answers.each do |answer|
          answer.update_attributes! is_right: true
          winning_user = answer.user
          transaction = AccountTransaction.create!(value: winning_value, user: winning_user, status: 'pending', action: 'win')
          transaction.execute!
        end
      end
    end

    def handle_wrong_answer!
      self.answers.where(value: !self.right_answer).each {|a| a.update_attributes! is_right: false}
    end

end
