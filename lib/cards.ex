defmodule Cards do
  @moduledoc """
    Provides functions to handle cards
  """

  @doc """
    Create list of cards
  """
 def create_deck do
   values = ["Ace", "Two", "Three", "Four", "Five"]
   suits = ["Spades", "Clubs", "Hears", "Diamonds"]
   
  #  for value <- values do
  #     for suit <- suits do
  #       "#{value} of #{suit}"
  #     end
  #  end

  for value <- values, suit <- suits do
    "#{value} of #{suit}"
  end
  # for suit <- suits, value <- values do
  #   "#{value} of #{suit}"
  # end
 end

 def shuffle(deck) do
  Enum.shuffle(deck)
 end

 def contains?(deck, card) do
  Enum.member?(deck, card)
 end

 @doc """
  Receive `deck` and `hand_size` as parameters and return a tuple witch first 
  argument is a hand with size defined by user

  ## Examples
     iex(3)> deck = Cards.create_deck
     iex(6)> { hand, _deck } = Cards.deal(deck, 1)
     iex(7)> hand
     ["Ace of Spades"]
 """
 def deal(deck, hand_size) do
   Enum.split(deck, hand_size)
 end

 def save(deck, filename) do
   binary = :erlang.term_to_binary(deck)
   File.write(filename, binary)
 end

 def load(filename) do
  # {status, binary} = File.read(filename)
  case File.read(filename) do
    {:ok, binary} -> :erlang.binary_to_term(binary)
    {:error, response} -> "That file does not exist #{response}"
  end
 end

 def create_hand(hand_size) do
  #  deck = Cards.create_deck
  #  deck = Cards.shuffle(deck)
  #  hand = Cards.deal(hand_size)
  Cards.create_deck
  |> Cards.shuffle
  |> Cards.deal(hand_size)
 end

end
