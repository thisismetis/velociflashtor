class DashboardsController < ApplicationController

  def show
    @decks = current_user.decks.order(created_at: :desc).last(5)
    @most_recommended = Deck.order(likes_count: :desc).first(5)
  end

end
