require 'spec_helper'

describe User do
  describe '#answered?' do
    before do
      @user = FactoryGirl.create :user
      @question = FactoryGirl.create :question
    end

    it 'return false if user has answer to the question' do
      expect(@user.answered? @question).to be_true
    end

    it 'return true if user has not answer to the question' do
      @question.answers.create value: true, user: @user
      expect(@user.answered? @question).to be_false
    end
  end
end
