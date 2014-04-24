class Result
  def initialize(card, guesses)
    @card = card
    @guesses = guesses
  end

  attr_accessor  :guesses, :card
end
