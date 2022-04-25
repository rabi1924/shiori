class FavoritesController < ApplicationController
  def create
    @memo = Memo.find(params[:memo_id])
    favorite = current_user.favorites.new(memo_id: @memo.id)
    favorite.save
  end

  def destroy
    @memo = Memo.find(params[:memo_id])
    favorite = current_user.favorites.find_by(memo_id: @memo.id)
    favorite.destroy
  end
end
