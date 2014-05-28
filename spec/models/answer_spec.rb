require 'spec_helper'

describe Answer do
  describe '.right' do
    it 'returns true if answer is right' do
      question = FactoryGirl.create :question, status: 'closed', right_answer: true
      answer   = FactoryGirl.create :answer, question: question, value: true
      expect(answer.right?).to be_true      
    end
    
    it 'returns false if answer is not right' do
      question = FactoryGirl.create :question, status: 'closed', right_answer: false
      answer   = FactoryGirl.create :answer, question: question, value: true
      expect(answer.right?).to be_false
    end
    
    it 'returns false if question is active' do
      question = FactoryGirl.create :question, status: 'active', right_answer: false
      answer   = FactoryGirl.create :answer, question: question, value: false
      expect(answer.right?).to be_false  
    end
  end
end
