class House < ApplicationRecord
  before_create :create_uuid
  has_many :users



  protected
  def self.create_houses
    House.all.each do |h| h.destroy end
    houses = [
      {hid:1, name:"House Stark",     words:"Winter  Is  Coming",         image:"/assets/houses/stark.png"},
      {hid:2, name:"House Lannister", words:"Hear  Me  Roar",             image:"/assets/houses/lannister.png"},
      {hid:3, name:"House Targaryen", words:"Fire  And  Blood",           image:"/assets/houses/targaryen.png"},
      {hid:4, name:"Free Folk",       words:"We  Do  Not  Kneel",          image:"/assets/houses/freefolk.png"},
      {hid:5, name:"House Baratheon", words:"Ours  Is  The  Fury",         image:"/assets/houses/baratheon.png"},
      {hid:6, name:"House Martell",   words:"Unbowed,  Unbent,  Unbroken",image:"/assets/houses/martell.png"},
      {hid:7, name:"House Tyrell",    words:"Growing  Strong",           image:"/assets/houses/tyrell.png"},
      {hid:8, name:"House Tully",     words:"Family,  Duty,  Honor",      image:"/assets/houses/tully.png"},
      {hid:9, name:"House Greyjoy",   words:"We  Do  Not  Sow",            image:"/assets/houses/greyjoy.png"},
      {hid:10,name:"House Arryn",     words:"As  High  As  Honor",         image:"/assets/houses/arryn.png"},
    ]
    houses.each do |h|
      House.create(h)
    end
  end

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end

end
