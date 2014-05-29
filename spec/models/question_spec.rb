require 'spec_helper'

describe Question do
  describe '.yield_outcome' do
    before :each do
      @question = FactoryGirl.create :question
      @question.update_attributes! status: 'closed', right_answer: true
    end

    it 'sets is_right = false for wrong answers' do
      answer = FactoryGirl.create :answer, question: @question, value: false
      expect{@question.yield_outcome}.to change{answer.reload.is_right}.to(false)
    end

    it 'sets is_right = true for right answers' do
      answer = FactoryGirl.create :answer, question: @question, value: true
      expect{@question.yield_outcome}.to change{answer.reload.is_right}.to(true)
    end

    it "updates user's account for right answer" do
      answer = FactoryGirl.create :answer, question: @question, value: true
      expect{@question.yield_outcome}.to change{answer.reload.user.account}.by(10)
    end
    it "doesn't update user's account for wrong answer" do
      answer = FactoryGirl.create :answer, question: @question, value: false
      expect{@question.yield_outcome}.to change{answer.reload.user.account}.by(0)
    end
  end
end
