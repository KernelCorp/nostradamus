# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    value false
    association :question
    association :user
  end

  factory :answer_for_closed_question, class: 'Answer' do
    value true
    association :question, factory: :closed_question
    association :user
  end
end
