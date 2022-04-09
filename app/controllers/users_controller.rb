class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @memos = @user.memos.order('created_at DESC')
  end
end
