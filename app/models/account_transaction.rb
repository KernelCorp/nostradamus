class AccountTransaction
  include Mongoid::Document
  field :value, type: Integer
  field :action, type: String
  field :status, type: String

  belongs_to :user
  belongs_to :question

  def execute!
    unless self.status == 'done'
      self.user.update_attributes! account: (self.user.account + self.value)
      self.update_attributes! status: 'done'
    end
  end

end
