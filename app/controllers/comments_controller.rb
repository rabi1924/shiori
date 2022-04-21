class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to memo_path(@comment.memo)
    else
      @memo = @comment.memo
      @comments = @memo.comments
      render 'memos/show'
    end
  end

  def destroy
    Comment.find_by(params[:id] || params[:memo_id]).destroy
    redirect_to memo_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, memo_id: params[:memo_id])
  end
end
