class HouseAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :house_question
  belongs_to :house

  protected

  def self.create_answers(user)
    answers = [
      {aid:1, text:"", episode:1},
      {aid:2, text:"", episode:1},
      {aid:3, text:"", episode:1},
      {aid:4, text:"", episode:2},
      {aid:5, text:"", episode:2},
      {aid:6, text:"", episode:2},
      {aid:7, text:"", episode:3},
      {aid:8, text:"", episode:3},
      {aid:9, text:"", episode:3},
      {aid:10, text:"", episode:4},
      {aid:11, text:"", episode:4},
      {aid:12, text:"", episode:4},
      {aid:13, text:"", episode:5},
      {aid:14, text:"", episode:5},
      {aid:15, text:"", episode:5},
      {aid:16, text:"", episode:6},
      {aid:17, text:"", episode:6},
      {aid:18, text:"", episode:6}
    ]
    answers.each do |a|
      user.house_answers.create(a)
      user.house_answers.last.update(house_question_id: a[:aid])
    end
  end

  def self.create_house_answers(house)
    answers = [
      {aid:1, text:"", episode:1},
      {aid:2, text:"", episode:1},
      {aid:3, text:"", episode:1},
      {aid:4, text:"", episode:2},
      {aid:5, text:"", episode:2},
      {aid:6, text:"", episode:2},
      {aid:7, text:"", episode:3},
      {aid:8, text:"", episode:3},
      {aid:9, text:"", episode:3},
      {aid:10, text:"", episode:4},
      {aid:11, text:"", episode:4},
      {aid:12, text:"", episode:4},
      {aid:13, text:"", episode:5},
      {aid:14, text:"", episode:5},
      {aid:15, text:"", episode:5},
      {aid:16, text:"", episode:6},
      {aid:17, text:"", episode:6},
      {aid:18, text:"", episode:6}
    ]
    answers.each do |a|
      house.house_answers.create(a)
      house.house_answers.last.update(house_question_id: a[:aid])
    end
  end
end
