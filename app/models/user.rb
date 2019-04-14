class User < ApplicationRecord
  attr_accessor :reset_token
  has_secure_password
  before_create :create_uuid
  belongs_to :house
  has_many :characters
  has_many :answers
  has_many :house_answers
  validates :email, :uniqueness => { :case_sensitive => false }, format: { with: URI::MailTo::EMAIL_REGEXP }, length: {maximum: 256}
  validates :username, :uniqueness => { :case_sensitive => false }, format:{ with: /\A[a-zA-Z0-9]+\z/i, message: "can only contain letters and numbers." }, length: { in: 5..20, message: "must be between 5 and 20 characters long"}
  validates :password, length: { in: 6..20}
  validates :house_id, presence:true
  default_scope { order(created_at: :asc) }

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def update_points
    @points = 0
    self.characters.all.each do |c|
      @points = @points + c.points
    end
    self.answers.all.each do |a|
      if a.correct.eql? true
        question = Question.find_by(qid: a.rid)
        @points= @points + question.value
      end
    end
    self.update_column(:points, @points)
  end

  def get_bonus_points
    @points = 0
    self.answers.all.each do |a|
      if a.correct.eql? true
        question = Question.find_by(qid: a.rid)
        @points= @points + question.value
      end
    end
    return @points
  end

  def get_character_points
    @points = 0
    self.characters.all.each do |c|
      @points = @points + c.points
    end
    return @points
  end
  def alive_characters
    c = self.characters.where(status: "alive")
    if c.eql? nil
      return []
    else
      return c
    end
  end

  def dead_characters
    c = self.characters.where(status: "dead")
    if c.eql? nil
      return []
    else
      return c
    end
  end

  def wight_characters
    c = self.characters.where(status: "wight")
    if c.eql? nil
      return []
    else
      return c
    end
  end

  def no_status_characters
    c = self.characters.where(status: "none")
    if c.eql? nil
      return []
    else
      return c
    end
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
