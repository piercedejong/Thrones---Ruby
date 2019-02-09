class User < ApplicationRecord
  has_secure_password
  before_create :create_uuid
  has_many :characters
  has_many :answers
  validates :email, presence: true, :uniqueness => true
  validates :username, presence: true, :uniqueness => true
  default_scope { order(created_at: :asc) }

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end


  def points
    @points = 1
    self.characters.all.each do |c|
      @points = @points + c.points
    end
    return @points
  end
end
