class PostController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new
    @post.title = params[:post][:title]
    @post.image = params[:post][:image]
    @post.user = current_user

    if @post.save
      redirect_to post_path(current_user.id, @post)
    else
      render :new
    end
  end

end
