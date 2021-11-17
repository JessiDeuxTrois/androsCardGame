class Player
  attr_accessor :name, :deck
  
  def initialize (name)
    self.name = name
    self.deck = []
  end
end

class Deck
  attr_accessor :cards
  
  def initialize ()
    self.cards = []

    # Ace would be 1, Jack would be 11, Queen would be 12, King would be 13
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13].each do |number|
      4.times do
        cards << number
      end
    end
  end

  def shuffle
    cards.shuffle
  end
end

class Game
  def initialize (player1, player2, player3, player4, player5, dealer)
    # given more time, I would try and change this to be more fluid
    # for example, instead of calling 5 different players, making this less manual
    @p1 = player1
    @p2 = player2
    @p3 = player3
    @p4 = player4
    @p5 = player5
    @dealer = dealer
    setup (@p1)
    setup (@p2)
    setup (@p3)
    setup (@p4)
    setup (@p5)
    setup (@dealer)
  end

  def setup (player)
    @starting_deck = Deck.new.shuffle
    @starting_deck.each do |card|
      if player.deck.length < 2
        player.deck << card
        @starting_deck.delete(card)
      end
    end
  end

  def result
    result_array = []

    result_array.push(@p1.deck.sum, @p2.deck.sum, @p3.deck.sum, @p4.deck.sum, @p5.deck.sum)

    if @dealer.deck.sum > result_array.max
      STDOUT.print("Dealer is the winner")
    else
      if result_array.max == @p1.deck.sum
        STDOUT.print("Player1 is the winner")
      elsif result_array.max == @p2.deck.sum
        STDOUT.print("Player2 is the winner")
      elsif result_array.max == @p3.deck.sum
        STDOUT.print("Player3 is the winner")
      elsif result_array.max == @p4.deck.sum
        STDOUT.print("Player4 is the winner")
      elsif result_array.max == @p5.deck.sum
        STDOUT.print("Player5 is the winner")
      end
    end
  end
end

player1 = Player.new("Player1")
player2 = Player.new("Player2")
player3 = Player.new("Player3")
player4 = Player.new("Player4")
player5 = Player.new("Player5")
dealer = Player.new("Dealer")
game = Game.new(player1, player2, player3, player4, player5, dealer)
game.result