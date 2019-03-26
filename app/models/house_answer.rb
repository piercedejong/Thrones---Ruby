class HouseAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :house_question
end
