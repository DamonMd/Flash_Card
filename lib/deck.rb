require 'pry'
require 'pg'
require 'active_record'
require_relative '../db/connection'

class Deck < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  validates :category, uniqueness: true



  def to_s
    return"Deck Number: #{id}, #{category}"
  end

end
