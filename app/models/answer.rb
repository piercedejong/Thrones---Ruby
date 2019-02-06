class Answer < ApplicationRecord
  belongs_to :user


  protected

  def self.create_answers(user)
    answers=[
      {rid:1, text:""},
      {rid:2, text:""},
      {rid:3, text:""},
    ]
    answers.each do |a|
      user.answers.create(a)
    end
  end
end
