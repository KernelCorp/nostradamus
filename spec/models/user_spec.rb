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

  describe '.questions' do
    before :all do
      @question_1 = FactoryGirl.create :question
      @user = @question_1.user
      @question_2 = FactoryGirl.create :question, user: @user
    end

    it "return user's question in all categories" do
      expect(@user.questions).to eq([@question_1, @question_2])
    end
  end

  describe '.rate' do
    it 'returns percentage of right answer' do
      user = FactoryGirl.create :user
      FactoryGirl.create :answer_for_closed_question, user: user, value: false
      FactoryGirl.create :answer_for_closed_question, user: user, value: true
      expect(user.rate).to eq(50)
    end

    it 'returns 0 is user has not answer' do
      user = FactoryGirl.create :user
      expect(user.rate).to eq(0)
    end
  end
end
