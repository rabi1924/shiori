class MemosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)

    if @memo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @memo.comments.includes(:user)
  end

  def edit
  end

  def update
    @memo.update(memo_params)

    if @memo.save
      redirect_to memo_path(@memo.id)
    else
      render :edit
    end
  end

  def destroy
    @memo.destroy
    redirect_to root_path
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :goal, :action, :note).merge(user_id: current_user.id)
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, memo_id: params[:memo_id])
  end
end
