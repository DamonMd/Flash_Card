# require 'pry'
require 'pg'
require 'active_record'
require_relative '../db/connection'

class Deck < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, length: {minimum: 1, maximum: 100}

  def to_s
    return"Deck: #{id}, #{name}"
  end

end
