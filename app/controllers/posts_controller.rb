class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    #dashboard- load all the posts
    @posts = Post.active
    @comment = Comment.new

    #list of ids already followed by the current user
    following_ids = Follower.where(follower_id: current_user.id).map(&:following_id)

    #add current_user id to the list to make sure current_user does not show up on the suggestions
    following_ids << current_user.id

    @followers_suggestions = User.where.not(id: following_ids)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # binding.pry
    @post.user = current_user if user_signed_in?
    if @post.save && @post.valid?
      redirect_to posts_path
    else
      render "new"
    end
  end

  def show
    @comment = Comment.new
    @post = Post.find_by_id(params[:id])
    user = User.find_by_id(params[:user_id])
    #the link can't be accessed with invalid user or post id
    if !@post || !user
      redirect_to posts_path
    end
  end

  def edit
    if !@post || @post.user_id != current_user.id
      redirect_to posts_path
    end
  end

  def update
    if @post
      @post.update(post_params)
      if @post.errors.any?
        render "edit"
      else
        redirect_to user_post_path(@post.user_id, @post.id)
      end
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :image_cache, :description)
  end
end
