class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: @user))

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Post saved successfully'
          redirect_to post_url(@user, @post)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          puts @comment.errors.full_messages
          render :new, locals: { comment: @comment }
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
