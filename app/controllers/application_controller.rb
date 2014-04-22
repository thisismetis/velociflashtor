class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def find_deck
    Deck.find(params[:deck_id])
  end

  def find_card
    Card.find(params[:card_id])
  end
end
