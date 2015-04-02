
require 'pg'
require 'active_record'
require_relative '../db/connection'


class Card < ActiveRecord::Base
  belongs_to :deck
  validates :card_front, length: {minimum: 1, maximum: 100}
  validates :card_back, length: {minimum: 1, maximum: 100}
  # validates :card_played,
  # validates :guess_right,

  def to_s
    return"Card number:#{id}, Question: #{card_front}"
  end

  def self.mark_correct
      return guess_right = true
  end

#   def update_card
#     puts "What should the front of the card read?"
#     card_front = gets.chomp
#     puts "What should the back of the card read?"
#     card.card_back = gets.chomp
# end
end
