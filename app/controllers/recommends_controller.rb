class RecommendsController < ApplicationController

  def create
    deck = find_deck
    @recommend = current_user.recommend(deck)
  end

  def destroy
    recommend = Recommend.find(params[:id])
    @deck = recommend.deck
    current_user.unrecommend(@deck)
  end
end
