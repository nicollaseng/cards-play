defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck must return 20 cards" do
    assert length(Cards.create_deck) == 20
  end

  test "shuffe deck must return a different content" do
    assert Cards.create_deck != Cards.shuffle(Cards.create_deck)
  end
end
