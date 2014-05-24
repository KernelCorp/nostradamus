# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "MyString"
    text "MyText"
    end_date "2014-05-24 14:36:18"
    start_date "2014-05-24 14:36:18"
    association :category
  end
end
