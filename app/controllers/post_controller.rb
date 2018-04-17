class PostController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    confirm_user(@user, post_path(@user, @post.id))
  end

  def update
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])

    if confirm_user(@user, post_path(@user, @post.id))
      @post.title = params[:post][:title]
      if @post.save
         redirect_to post_path(current_user.id, @post)
       else
         render :edit
      end
    end
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

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])

    if confirm_user(@user, post_path(@user, @post.id))
      if @post.destroy
        redirect_to user_show_path(current_user)
      else
        render :edit
      end
    end
  end
end
