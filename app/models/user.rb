class User < ApplicationRecord
  has_secure_password
  before_create :create_uuid
  has_many :characters
  validates :email, presence: true, uniqueness: true

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
end
