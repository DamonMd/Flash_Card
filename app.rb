require 'active_record'
require 'pry'

require_relative 'db/connection'
require_relative 'lib/card'
require_relative 'lib/deck'


def get_deck_info
  new_deck = {}
  puts "What do you want the new name to be?"
  new_deck[:name] = gets.chomp
  return new_deck
end

def get_card_info(deck)
  card_info = {}
  puts "What should the front of the card say?"
  card_info[:front] = gets.chomp
  puts "What should the back of the card say?"
  card_info[:back] = gets.chomp
  card_info[:score] = 0
  card_info[:attempts] = 0
  card_info[:deck_id] = deck.id
  return card_info
end

def line_break
  puts "***********************************************"
end

def get_deck
  puts 'Which Deck #?'
  show_all_decks
  deck_id = gets.chomp.to_i
  return Deck.find_by(id: deck_id)
end

def show_all_decks
  puts Deck.all
end

def show_all_cards
  puts Card.all
end

def clear
  sleep 1
  system"clear"
end

def increment_attributes(card)
  card.score +=1
  card.attempts +=1
  card.save
end

def card_choice
  show_all_cards
  selection = gets.chomp.to_i
  return Card.find_by(id: selection)
end

def menu
  line_break
  puts "Your current Flash Decks:"
  show_all_decks
  line_break
  puts "Welcome to Flash Cards! Please Choose an Option"
  puts "1. Play!"
  puts "2. Add flash cards to a deck"
  puts "3. Create a new deck"
  puts "4. Edit a flash card"
  puts "5. Delete a flash card"
  puts "6. View Score"
  puts "7. Quit"
#Maybe have edit a deck, with a sub menu?or play game with a diff menu?
return gets.chomp.to_i
end

current_score = 0
current_attempts = 0

loop do
  user_choice = menu

  if user_choice == 1
      clear
      deck = get_deck
      puts "Enter 'q' at anytime to quit"
      cards = deck.cards.map {|card| card }
      while cards.count > 0
        card = cards.pop
        puts card.front
        puts "What is your answer?"
        answer = gets.chomp
          if answer == 'q'
            break
          elsif answer.downcase == card.back.downcase
            puts ""
            puts "Good Job!"
            puts "The answer was indeed #{card.back}"
            increment_attributes(card)
            current_score +=1
            current_attempts +=1
            line_break
            clear
          else
            puts ""
            puts "Sorry, the answer was #{card.back}"
            card.attempts +=1
            current_attempts +=1
            cards.unshift(card)
            line_break
            clear
          end
      end
  end

  if user_choice == 2
    clear
    deck = get_deck
    new_card = Card.create(get_card_info(deck))
  end

  if user_choice == 3
    clear
    Deck.create(get_deck_info)
  end

  if user_choice == 4
    clear
    puts "Which card would you like to edit?"
    card = card_choice
    puts "What should the front of the card read?"
    card.front = gets.chomp
    puts "What should the back of the card read?"
    card.back = gets.chomp
    card.save
    clear
  end

  if user_choice == 5
    puts "Which card would you like to delete?"
    card = card_choice
    card.destroy
  end

  if user_choice == 6
    clear
    total_score = Card.sum(:score)
    attempts = Card.sum(:attempts)
    puts "Overall you have #{total_score} points!"
    puts ''
    puts "Current round score:#{current_score}"
    puts "Total of attempts this round:#{current_attempts}"
    puts line_break
  end

  if user_choice == 7
    break
  end

end
