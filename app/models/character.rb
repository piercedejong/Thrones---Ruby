class Character < ApplicationRecord
  before_create :create_uuid
  belongs_to :user
  default_scope { order(created_at: :asc) }



  protected
  def self.create_characters(user)
    characters=[
      {cid:1, name:"Jon Snow"},
      {cid:2, name:"Arya Stark"},
      {cid:3, name:"Sansa Stark"},
      {cid:4, name:"Bran Stark"},
      {cid:5, name:"Cersei Lannister"},
      {cid:6, name:"Jaime Lannister"},
      {cid:7, name:"Tyrion Lannister"},
      {cid:8, name:"Daenerys Targaryen"},
      {cid:9, name:"Yara Greyjoy"},
      {cid:10, name:"Theon Greyjoy"},
      {cid:11, name:"Euron Greyjoy"},
      {cid:12, name:"Melisandre"},
      {cid:13, name:"Jorah Mormont"},
      {cid:14, name:"The Hound"},
      {cid:15, name:"The Mountain"},
      {cid:16, name:"Samwell Tarley"},
      {cid:17, name:"Gilly"},
      {cid:18, name:"Sam (Child)"},
      {cid:19, name:"Lord Varys"},
      {cid:20, name:"Brienne of Tarth"},
      {cid:21, name:"Davos Seaworth"},
      {cid:22, name:"Bronn"},
      {cid:23, name:"Podrick Payne"},
      {cid:24, name:"Tormund Giantsbane"},
      {cid:25, name:"Qyburn"},
      {cid:26, name:"Grey Worm"},
      {cid:27, name:"Gendry"},
      {cid:28, name:"Beric Dondarrion"},
      {cid:29, name:"Daario"},
      {cid:30, name:"Dolorous Edd"},
      {cid:31, name:"Missandei"},
      {cid:32, name:"Ghost"},
      {cid:33, name:"Nymeria"},
      {cid:34, name:"Drogon"},
      {cid:35, name:"Rhaegal"},
    ]
    characters.each do |c|
      user.characters.create(c)
    end
  end

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
end
