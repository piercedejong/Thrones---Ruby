class HouseQuestion < ApplicationRecord
  has_many :house_answers
  default_scope { order(created_at: :asc) }

  protected
  def self.create_questions
    HouseQuestion.create(
      [
        {qid:4, episode:2 ,text:"Episode 2 Question 1"},
        {qid:5, episode:2 ,text:"Episode 2 Question 2"},
        {qid:6, episode:2 ,text:"Episode 2 Question 3"},
        {qid:7, episode:3 ,text:"Episode 3 Question 1"},
        {qid:8, episode:3 ,text:"Episode 3 Question 2"},
        {qid:9, episode:3 ,text:"Episode 3 Question 3"},
        {qid:10, episode:4 ,text:"Episode 4 Question 1"},
        {qid:11, episode:4 ,text:"Episode 4 Question 2"},
        {qid:12, episode:4 ,text:"Episode 4 Question 3"},
        {qid:13, episode:5 ,text:"Episode 5 Question 1"},
        {qid:14, episode:5 ,text:"Episode 5 Question 2"},
        {qid:15, episode:5 ,text:"Episode 5 Question 3"},
        {qid:16, episode:6 ,text:"Episode 6 Question 1"},
        {qid:17, episode:6 ,text:"Episode 6 Question 2"},
        {qid:18, episode:6 ,text:"Episode 6 Question 3"},
      ]
    )
  end
end
