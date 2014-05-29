require 'spec_helper'

describe User do
  describe '#answered?' do
    before do
      @user = FactoryGirl.create :user
      @question = FactoryGirl.create :question
    end

    it 'return false if user has answer to the question' do
      expect(@user.answered? @question).to be_false
    end

    it 'return true if user has not answer to the question' do
      @question.answers.create value: true, user: @user
      expect(@user.answered? @question).to be_true
    end
  end

  describe '.rate' do
    it 'returns percentage of right answer' do
      user = FactoryGirl.create :user
      FactoryGirl.create :answer_for_closed_question, user: user, is_right: false
      FactoryGirl.create :answer_for_closed_question, user: user, is_right: true
      expect(user.rate).to eq(50)
    end

    it 'returns 0 is user has not answer' do
      user = FactoryGirl.create :user
      expect(user.rate).to eq(0)
    end
  end
end
