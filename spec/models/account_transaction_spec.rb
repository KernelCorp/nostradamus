require 'spec_helper'

describe AccountTransaction do
  describe 'execute transaction' do
    before do
      @account_transaction = FactoryGirl.create :account_transaction
      @account_transaction.user.account = 6
    end

    it 'execute transaction if status is not done' do
      @account_transaction.execute_transaction
      expect(@account_transaction.user.account).to  eq (11)
    end

    it 'prevent transaction if status is done' do
      @account_transaction.status = 'done'
      @account_transaction.execute_transaction
      expect(@account_transaction.user.account).to eq (6)
    end
  end
end
