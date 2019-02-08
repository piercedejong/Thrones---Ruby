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
      {cid:5, name:"Samwell Tarley"},
      {cid:6, name:"Gilly"},
      {cid:7, name:"Sam (Child)"},
      {cid:8, name:"Gendry"},
      {cid:9, name:"Davos Seaworth"},
      {cid:10, name:"Daenerys Targaryen"},
      {cid:11, name:"Jorah Mormont"},
      {cid:12, name:"Missandei"},
      {cid:13, name:"Grey Worm"},
      {cid:14, name:"Brienne of Tarth"},
      {cid:15, name:"Podrick Payne"},
      {cid:16, name:"Lord Varys"},
      {cid:17, name:"Sandor Clegane"},
      {cid:18, name:"Gregor Clegane"},
      {cid:19, name:"Tyrion Lannister"},
      {cid:20, name:"Cersei Lannister"},
      {cid:21, name:"Jaime Lannister"},
      {cid:22, name:"Yara Greyjoy"},
      {cid:23, name:"Theon Greyjoy"},
      {cid:24, name:"Euron Greyjoy"},
      {cid:25, name:"Bronn"},
      {cid:26, name:"Melisandre"},
      {cid:27, name:"Qyburn"},
      {cid:28, name:"Tormund Giantsbane"},
      {cid:29, name:"Beric Dondarrion"},
      {cid:30, name:"Dolorous Edd"},
      {cid:31, name:"Robin Arryn"},
      {cid:32, name:"Lyanna Mormont"},
      {cid:33, name:"Meera Reed"},
      {cid:34, name:"Yohn Royce"},
      {cid:35, name:"Ghost"},
      {cid:36, name:"Nymeria"},
      {cid:37, name:"Drogon"},
      {cid:38, name:"Rhaegal"},
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
