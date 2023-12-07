class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts.includes(comments: :user)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @post_comments = @post.comments.includes(:user)
  end
end
