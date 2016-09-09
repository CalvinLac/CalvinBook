class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.update
      redirect_to user_path(current_user)
    end
  end 

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id, :id)
  end

end
