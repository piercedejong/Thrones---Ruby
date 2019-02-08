class Answer < ApplicationRecord
  belongs_to :user


  protected

  def self.create_answers(user)
    answers=[
      {rid:1, text:"",value:0},
      {rid:2, text:"",value:0},
      {rid:3, text:"",value:0},
      {rid:4, text:"",value:0},
      {rid:5, text:"",value:0},
      {rid:6, text:"",value:0},
    ]
    answers.each do |a|
      user.answers.create(a)
    end
  end
end
