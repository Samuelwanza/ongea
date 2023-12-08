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

  def new
    @post = Post.new
    @user = current_user
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to post_url(@user, @post)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: @post } # Corrected to use @post instead of post
        end
      end
    end
  end

  def like
    @user = current_user
    @post = Post.find(params[:post_id])

    if @user.likes.exists?(post: @post)
      @user.likes.find_by(post: @post).destroy
    else
      @user.likes.create(post: @post)
    end

    redirect_to post_url(@user, @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
