class DashboardsController < ApplicationController
  def show
    @decks = current_user.decks.order(created_at: :desc).last(5)
  end
end
