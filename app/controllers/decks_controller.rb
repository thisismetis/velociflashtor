class DecksController < ApplicationController
  def new
    @deck = Deck.new
  end

  def create
    deck = current_user.decks.create(deck_params)
    redirect_to new_deck_card_path(deck)
  end

  def show
    @deck = find_deck
  end


  private
  def deck_params
    params.require(:deck).permit(:name)
  end

  def find_deck
    Deck.find(params[:id])
  end

end
