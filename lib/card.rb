
require 'pg'
require 'active_record'
require_relative '../db/connection'


class Card < ActiveRecord::Base
  belongs_to :deck
  validates :front, length: {minimum: 1, maximum: 100}
  validates :back, length: {minimum: 1, maximum: 100}


  def to_s
    return"Card number:#{id},\nQuestion: #{front},\nAnswer: #{back}\n-------------------"
  end

  # def increment_attributes
  #   card.score +=1
  #   card.attempts +=1
  #   card.save
  # end
end
