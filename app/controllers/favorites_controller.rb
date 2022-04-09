class FavoritesController < ApplicationController
  def create
    @memo_favorite = Favorite.new(user_id: current_user.id, memo_id: params[:memo_id])
    @memo_favorite.save
    redirect_to memo_path(params[:memo_id])
  end

  def destroy
    @mwmo_favorite = Favorite.find_by(user_id: current_user.id, memo_id: params[:memo_id])
    @mwmo_favorite.destroy
    redirect_to memo_path(params[:memo_id])
  end
end
