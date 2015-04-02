require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../db/connection'

Deck.destroy_all
Card.destroy_all

ruby_deck = Deck.create({category: 'Ruby'})
data_types_deck = Deck.create({category: 'Data Types'})


#card_front, card_back, guess_right, card_played
data_types_deck.cards.create([
    {card_front: 'This type is used typically for words or to print to the screen', card_back: 'string',
    guess_right: false, card_played: false},
    {card_front: 'This type is composed of whole numbers', card_back: 'integer',
    guess_right: false, card_played: false}
    ])

ruby_deck.cards.create([
    {card_front: 'Creator of the Ruby language', card_back: 'Matsumoto',
    guess_right: false, card_played: false},
    {card_front: 'This method will place an array in order', card_back: '.sort',
    guess_right: false, card_played: false}
    ])
