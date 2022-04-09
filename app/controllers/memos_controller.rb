class MemosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_memo, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
    @memos = Memo.status_public.order('created_at DESC')
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
    redirect_to memos_path if @memo.status_private? && @memo.user.id != current_user.id
    @comment = Comment.new
    @comments = @memo.comments.includes(:user)
  end

  def edit
    redirect_to action: :index unless user_signed_in? && current_user.id == @memo.user_id
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

  def search
    @memos = Memo.status_public.search(params[:keyword])
  end

  def toggle_status
    @memo.toggle_status!
    redirect_to root_path
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :goal, :action, :note, :status).merge(user_id: current_user.id)
  end

  def set_memo
    @memo = Memo.find(params[:id] || params[:memo_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, memo_id: params[:memo_id])
  end
end
