# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "MyString"
    text "MyText"
    end_date "2014-05-24 14:36:18"
    start_date "2014-05-24 14:36:18"
    association :category
    association :user
  end

  factory :closed_question, class: 'Question' do
    title "MyString"
    text "MyText"
    end_date "2014-05-24 14:36:18"
    start_date "2014-05-24 14:36:18"
    status 'closed'
    right_answer true
    association :category
    association :user
  end
end
