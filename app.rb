require 'active_record'
require 'pry'

require_relative 'db/connection'
require_relative 'lib/card'
require_relative 'lib/deck'
#SINATRA

def get_deck_info
  new_deck = {}
  puts "What do you want the new Category to be?"
  new_deck[:category] = gets.chomp
  return new_deck
end

def get_card_info(deck)
  card_info = {}
  puts "What should the front of the card say?"
  card_info[:card_front] = gets.chomp
  puts "What should the back of the card say?"
  card_info[:card_back] = gets.chomp
  card_info[:guess_right] = false
  card_info[:card_played] = false
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


def menu
  line_break
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
#add view answers with score???
#Maybe have edit a deck, with a sub menu?or play game with a diff menu?
return gets.chomp.to_i
end

current_score = 0

loop do

  user_choice = menu()

  #make when/case statement instead?

  if user_choice == 1
    deck = get_deck
    deck.cards.each do |card|
      puts card.card_front
      puts "What is your answer?"
      answer = gets.chomp
        if answer.downcase == card.card_back
          puts ""
          puts "Good Job!"
          puts "The answer was indeed #{card.card_back}"
          # card.mark_correct
          card.guess_right = true
          card.save
          current_score +=1
          #card.attempts = card.attempts + 1????
          line_break
        else
          puts ""
          puts "Sorry, the answer was #{card.card_back}"
          line_break
        end
    end
  end


  if user_choice == 2
    deck = get_deck
    new_card = Card.create(get_card_info(deck))
    line_break
  end

  if user_choice == 3
    Deck.create(get_deck_info)
    line_break
  end

  if user_choice == 4
    puts "Which card would you like to edit?"
    show_all_cards
    selection = gets.chomp.to_i
    card = Card.find_by(id: selection)
    puts "What should the front of the card read?"
    card.card_front = gets.chomp
    puts "What should the back of the card read?"
    card.card_back = gets.chomp
    card.save
  end

  if user_choice == 5
    puts "Which card would you like to delete?"
    show_all_cards()
    card_selection = gets.chomp.to_i
    card_to_delete = Card.find_by(id: card_selection)
    card_to_delete.destroy
  end

  if user_choice == 6
    score = Card.where(guess_right: true).count
    potential_score = Card.count
    puts "Overall you have #{score} points!"
    puts "Out of a possible #{potential_score} points"
    puts "Current round score:#{current_score}"
    puts "******************************************"
  end

  if user_choice == 7
    #maybe add in score = current_score
    break
  end

end
