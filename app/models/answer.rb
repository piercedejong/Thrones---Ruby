class Answer < ApplicationRecord
  belongs_to :user


  protected

  def self.create_answers(user)
    answers=[
      {rid:1, text:"",value:1},
      {rid:2, text:"",value:2},
      {rid:3, text:"",value:4},
    ]
    answers.each do |a|
      user.answers.create(a)
    end
  end
end
