class HouseQuestion < ApplicationRecord
  has_many :house_answers


  protected
  def self.create_questions
    HouseQuestion.create(
      [
        {qid:1, text:"Will the White Walkers attack castle black? ONE Point"},
        {qid:2, text:"Will Ghost make an appearance? ONE Point"},
        {qid:3, text:"Will Jon Snow find out who his parents are? TWO Points"}
      ]
    )
  end
end
