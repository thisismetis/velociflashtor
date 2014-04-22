class DecksController < ApplicationController
  def index
    @decks = current_user.decks.order(created_at: :desc)
  end

  def new
    @deck = Deck.new
  end

  def create
    deck = current_user.decks.create(deck_params)
    redirect_to new_deck_card_path(deck)
  end

  def show
    @deck = find_deck
    @cards = @deck.cards
  end

  def update
    @deck = find_deck
    @deck.update(deck_params)
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :tag_list)
  end

  def find_deck
    Deck.find(params[:id])
  end

end
