class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to tune_path(@comment.tune.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tune_id: params[:tune_id])
  end
end
