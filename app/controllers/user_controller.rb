class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
