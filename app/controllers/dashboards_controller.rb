class DashboardsController < ApplicationController
  before_filter :authorize, only: [:show]

  def show
    @decks = current_user.decks.order(created_at: :desc).last(5)
    @most_recommended = Deck.order(recommends_count: :desc).first(5)
  end

end
