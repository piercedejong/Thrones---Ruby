class Character < ApplicationRecord
  before_create :create_uuid
  belongs_to :user



  protected
  def self.create_characters(user)
    characters=[
      {name:"Ned Stark"},
      {name:"Rob Stark"},
    ]
    characters.each do |c|
      user.characters.create(c)
    end
    binding.pry
  end

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
end
