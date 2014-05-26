require 'spec_helper'

describe AccountTransaction do
  describe '.execute' do
    before do
      @account_transaction = FactoryGirl.create :account_transaction
      @account_transaction.user.account = 6
    end

    it 'execute transaction if status is not done' do
      expect{@account_transaction.execute!}.to change{@account_transaction.user.account}.by(5)
    end

    it 'prevent transaction if status is done' do
      @account_transaction.status = 'done'
      expect{@account_transaction.execute!}.to change{@account_transaction.user.account}.by(0)
    end
  end
end
