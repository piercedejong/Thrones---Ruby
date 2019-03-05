class User < ApplicationRecord
  has_secure_password
  before_create :create_uuid
  belongs_to :house
  has_many :characters
  has_many :answers
  validates :email, :uniqueness => { :case_sensitive => false }, format: { with: URI::MailTo::EMAIL_REGEXP }, length: {maximum: 256}
  validates :username, :uniqueness => { :case_sensitive => false }, format:{ with: /\A[a-zA-Z0-9]+\z/i, message: "can only contain letters and numbers." }, length: { in: 5..15, message: "must be between 5 and 15 characters long"}
  validates :password, length: { in: 6..20}
  validates :house_id, presence:true
  default_scope { order(created_at: :asc) }

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end

  def points
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
end
