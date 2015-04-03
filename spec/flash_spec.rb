require_relative 'spec_helper'
# require_relative '../lib/card'
# require_relative '../lib/deck'
require_relative '../app'


#use spec to test out the METHODS ONLY. don't worry about total
#menu functionality.

#add in tests for validations

describe '#menu' do
  it "should print options to the screen" do
    expect(menu()).to_not be_nil
  end
#getting errors, may need to change the syntax
  it "should return an Integer" do
    choice = menu()
    expect(choice).to be > 0
    # expect(choice).should be_kind_of(Integer)
  end
end

# describe '#creating a new deck'do
#   it "should make sure it meets validations"do
#   new_deck = Deck.create({name: ''})
#   expect(Deck.all).to not_include
#   end
# end


describe '#show all decks' do
  it "should print all decks to the screen" do
    expect(show_all_decks()).to be_nil
  end
end

describe '#show all cards' do
  it "should print all cards to the screen" do
    expect(show_all_cards()).to be_nil
  end
end

describe '#get card info' do
  it "collects information for a new card" do
    new_card = get_card_info()
    expect(new_card[:card_front]).to_not be_nil
    expect(new_card[:card_back]).to_not be_nil
    expect(new_card[:score]).to eq(0)
    expect(new_card[:attempts]).to eq(0)
  end
end

describe '#get deck info' do
  it "collects information for a new deck" do
    new_deck = get_deck_info()
    expect(new_deck[:name]).to_not be_nil
  end
end

# describe '#get deck' do
#   it "returns a specific deck" do
#     deck = get_deck()
#     expect(deck[:category]).to_not be_nil
#   end
# end
