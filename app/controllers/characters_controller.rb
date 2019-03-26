class CharactersController < ApplicationController

  def index
    update_stats
    update_answers
  end


  def update_stats
    Death.all.each do |d|
      @alive = 0.0
      @dead = 0.0
      @wight = 0.0
      characters = Character.where({name: d.name, house_id:nil})
      characters.all.each do |c|
        if c.status.eql?"alive" or c.status.eql?"none"
          @alive +=1
        elsif c.status.eql?"dead"
          @dead+=1
        else
          @wight +=1
        end
      end
      d.update(alive: (@alive*100/User.count).round(2))
      d.update(dead: (@dead*100/User.count).round(2))
      d.update(wight: (@wight*100/User.count).round(2))
    end
  end


  def update_answers
    Question.all.each do |q|
      array = Array.new
      User.all.each do |u|
        a = u.answers.all.find_by(rid: q.qid).text
        if !a.eql?""
          array.push(a)
        end
      end
      freq = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      max = array.max_by { |v| freq[v] }
      total = freq.first.second
      total = (total / (User.count+0.0) * 100).round(2)
      text = max+", "+total.to_s+"%"
      q.update(answer:text)

    end
  end
end
