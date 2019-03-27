class HouseAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :house_question
  belongs_to :house

  protected

  def self.create_answers(user)
    answers = [
      {aid:1, text:""},
      {aid:2, text:""},
      {aid:3, text:""},
    ]
    answers.each do |a|
      user.house_answers.create(a)
      user.house_answers.last.update(house_question_id: a[:aid])
      user.house_answers.last.update(house_id: user.house.id)
    end
  end
end
