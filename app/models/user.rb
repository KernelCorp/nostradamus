class User
  include Mongoid::Document
  include Deviseable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:vkontakte]


  field :provider, type: String
  field :url, type: String
  field :username, type: String
  field :nickname, type: String

  field :account, type: Integer, default: 0

  def self.find_for_vkontakte_oauth(access_token)
    user = User.where(:url => access_token.info.urls.Vkontakte).first
    return user unless user.nil?
    User.create!(:provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain, :email => SecureRandom.hex(6) + '@gmail.com', :password => Devise.friendly_token[0,20])
  end

  has_many :answers
  has_many :account_transactions

  def answered?(question)
    answers.where(question: question).count > 0
  end

  def answer_for(question)
    answers.where(question: question).first
  end

  def questions
    Category.all.inject([]) { |questions, category| questions + category.questions.where(user: self) }
  end

  def rate
    Rails.cache.fetch "users_rate_#{self.id}", expires_in: 1.hour do
      right_count = answers.inject(0) { |sum, answer| sum + (answer.right? ? 1 : 0) }
      right_count * 100 / answers.count
    end
  end
end
