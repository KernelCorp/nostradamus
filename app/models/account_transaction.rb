class AccountTransaction
  include Mongoid::Document
  field :value, type: Integer
  field :action, type: String
  field :status, type: String

  belongs_to :user
  belongs_to :question

  def execute_transaction
    if self.status != 'done'
      self.user.account = self.user.account + self.value
      status = 'done'
    esle raise "Transaction has already complited."
    end
  end

end
