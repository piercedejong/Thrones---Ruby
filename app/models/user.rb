class User < ApplicationRecord
  has_secure_password
  before_create :create_uuid
  has_many :characters
  has_many :answers
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, :uniqueness => { :case_sensitive => false }, format: { without: /\s/ }, length: { in: 5..15}
  validates :password, presence:true, length: { in: 6..20}
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
end
