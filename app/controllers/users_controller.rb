class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile]

  def profile
    @posts = Post.where(user_id: @user.id)
    # passing the followers ids so that if current user already follow this user then the follow button does not show up
    @followers = @user.followers.map { |i| i.follower_id }
  end

  def follow_account
    following_id = params[:follow_id]
    follow = Follower.create(follower_id: current_user.id, following_id: following_id)
    # followee = User.find(following_id)
    if params[:profile_page]
      redirect_to params[:profile_page]
    else
      redirect_to posts_path
    end
  end

  def unfollow_account
    unfollow_id = params[:unfollow_id]
    # binding.pry
    Follower.where(following_id:unfollow_id, follower_id:current_user.id)[0].destroy
    if params[:profile_page]
      redirect_to params[:profile_page]
    else
      redirect_to posts_path
    end
  end

 def index
   @users = User.all
 end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
