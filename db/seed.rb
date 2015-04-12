require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../db/connection'

Deck.destroy_all
Card.destroy_all

ruby_deck = Deck.create({name:'Ruby'})
data_types_deck = Deck.create({name:'Data Types'})
french_deck = Deck.create({name: 'French'})

data_types_deck.cards.create([
    {front: 'This type is used typically for words or to print to the screen', back: 'string',
    score: 0, attempts: 0},
    {front: 'This type is composed of whole numbers', back: 'integer',
    score: 0, attempts: 0}
    ])

ruby_deck.cards.create([
    {front: 'Creator of the Ruby language', back: 'Matsumoto',
    score: 0, attempts: 0},
    {front: 'This method will place an array in order', back: '.sort',
    score: 0, attempts: 0}
    ])

french_deck.cards.create([
    {front: 'Chat', back: 'Cat', score:0, attempts: 0},
    {front: 'Chien', back: 'Dog', score:0, attempts: 0},
    {front: 'Aller', back: 'to go', score:0, attempts: 0},
    {front: 'Millefeuille', back: 'da bomb', score:0, attempts: 0},
    {front: 'Renard', back: 'Fox', score:0, attempts: 0},
    {front: "Je m'en fiche", back: "I don't care", score:0, attempts: 0}
  ])
