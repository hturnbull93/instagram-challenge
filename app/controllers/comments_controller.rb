class CommentsController < ApplicationController

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    p "created @comment id - #{@comment.id}"
    redirect_to post_path(@post)
  end

  def update
    p params
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
