class DecksController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  respond_to :html

  def index
    @decks = Deck.order(created_at: :desc).first(5)
  end

  def show
    @deck = find_deck
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.new(deck_params)
    respond_with @deck do |format|
      if @deck.save
        flash[:notice] = 'Deck created successfully'
        format.html { redirect_to new_deck_card_path(@deck) }
      else
        flash[:notice] = @deck.errors.full_messages.first
        format.html { render action: :new }
      end
    end
  end

  def edit
    @deck = find_deck
    @cards = @deck.cards
  end

  def update
    @deck = find_deck
    @deck.update(deck_params)
  end

  def destroy
    deck = find_deck
    deck.destroy
    redirect_to root_path
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :tag_list)
  end

  def find_deck
    Deck.find(params[:id])
  end

end
