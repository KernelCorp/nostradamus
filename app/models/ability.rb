class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read,   Question
    can :create, Answer
    can :create, Question if user.account > 1000
    can [:edit, :update, :destroy, :close], Question do |question|
      user.questions.include? question
    end
    can :answer, Question do |question|
      question.end_date.nil? || (question.end_date >= DateTime.now) && !(user.answered? question)
    end
  end
end
