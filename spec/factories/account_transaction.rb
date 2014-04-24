FactoryGirl.define do
  factory :account_transaction do
    value 5
    action 'win'
    status 'pending'
    association :user
    association :question
  end
end
