class User
  include Mongoid::Document
  include Deviseable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:vkontakte]


  field :provider, type: String
  field :url,      type: String
  field :username, type: String
  field :nickname, type: String
  field :account,  type: Integer, default: 0
  field :events_last_viewed_at, type: DateTime

  has_many :answers
  has_many :account_transactions
  has_many :questions

  def answered?(question)
    answers.where(question: question).count > 0
  end

  def answer_for(question)
    answers.where(question: question).first
  end

  def rate
    Rails.cache.fetch "users_rate_#{self.id}", expires_in: 1.hour do
      right_count = answers.right.size
      wrong_count = answers.wrong.size
      if (right_count + wrong_count) > 0
        right_count * 100 / (right_count + wrong_count)
      else
        0
      end
    end
  end

  def events
    questions = self.answered_questions
    new_events = Event.where(type: 'new_question').all

    #closed_events = Array.new
    #Event.where(type: 'close_question').all.each do |event|
    #  if questions.include? event.question
    #    closed_events << event
    #  end
    #end

    closed_events = Event.where(type: 'close_question').
                          in(question: questions).all
    new_events | closed_events
  end

  def answered_questions
    questions = Array.new
    self.answers.each do |answer|
      questions << answer.question
    end
    questions
  end

  def self.find_for_vkontakte_oauth(access_token)
    user = User.where(:url => access_token.info.urls.Vkontakte).first
    return user unless user.nil?
    User.create!(:provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain, :email => SecureRandom.hex(6) + '@gmail.com', :password => Devise.friendly_token[0,20])
  end
end
