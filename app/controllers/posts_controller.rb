class PostsController < ApplicationController

def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id
  if @post.save
    redirect_to user_path(current_user)
  end
end

def show
  @post = Post.find(params[:id])
  @comments = @post.comments
  @new_comment = Comment.new
end

def update
  @post = Post.find(params[:id])
  @post.update(post_params)
  if @post.save
    redirect_to post_path(@post)
  end
end
private
def post_params
  params.require(:post).permit(:body, :user_id, :id, :comments_attributes => [:body, :user_id, :post_id])
end 

end
