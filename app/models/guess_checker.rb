class GuessChecker
  include ActiveModel::Model

  def initialize(opts={})
    @card = opts[:card]
    @guess = opts[:guess]
  end

  def correct_guess?
    card.back.gsub(/\s+/, '').downcase == guess.gsub(/\s+/, '').downcase
  end

  private
  attr_reader :card, :guess
end
