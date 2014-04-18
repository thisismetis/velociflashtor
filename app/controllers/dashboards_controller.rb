class DashboardsController < ApplicationController
  def show
    @decks= current_user.decks.last(5).reverse
  end

end