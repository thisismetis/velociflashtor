class LikesController < ApplicationController

  def create
    deck = find_deck
    @like = current_user.recommend(deck)
  end

  def destroy
    like = Like.find(params[:id])
    @deck = like.deck
    current_user.unrecommend(@deck)
  end
end
