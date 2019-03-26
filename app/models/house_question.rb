class HouseQuestion < ApplicationRecord
  belongs_to :house
  has_many :house_questions
  
end
