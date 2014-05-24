class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read,   Question
    can :create, Answer
    can :create, Question if user.account > 1000
    can [:edit, :update, :destroy, :close], Question do |question|
      user.question.include? question
    end
  end
end
