class Character < ApplicationRecord
  before_create :create_uuid
  belongs_to :user



  protected
  def self.create_characters(user)
    characters=[
      {name:"Jon Snow"},
      {name:"Arya Stark"},
      {name:"Sansa Stark"},
      {name:"Bran Stark"},
      {name:"Cersei Lannister"},
      {name:"Jaime Lannister"},
      {name:"Tyrion Lannister"},
      {name:"Daenerys Targaryen"},
      {name:"Yara Greyjoy"},
      {name:"Theon Greyjoy"},
      {name:"Euron Greyjoy"},
      {name:"Melisandre"},
      {name:"Jorah Mormont"},
      {name:"The Hound"},
      {name:"The Mountain"},
      {name:"Samwell Tarley"},
      {name:"Gilly"},
      {name:"Sam (Child)"},
      {name:"Lord Varys"},
      {name:"Brienne of Tarth"},
      {name:"Davos Seaworth"},
      {name:"Bronn"},
      {name:"Podrick Payne"},
      {name:"Tormund Giantsbane"},
      {name:"Qyburn"},
      {name:"Grey Worm"},
      {name:"Gendry"},
      {name:"Beric Dondarrion"},
      {name:"Daario"},
      {name:"Dolorous Edd"},
      {name:"Missandei"},
      {name:"Ghost"},
      {name:"Nymeria"},
      {name:"Drogon"},
      {name:"Rhaegal"},
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
