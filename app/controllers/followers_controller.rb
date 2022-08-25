class FollowersController < ApplicationController

  # get a followers list for a particle user
  def followers_list
    ids = User.find_by_id(params[:id]).followers.map { |i| i.follower_id }
    @users = User.where(id: ids)
    # @users = User.followers_list(params[:id])
    # binding.pry
  end

  def following_list
    ids = User.find_by_id(params[:id]).followings.map { |i| i.following_id }
    @users = User.where(id: ids)

    # @users = User.followings_list(params[:id])
  end
end

# User.joins(:followers).where(followers: {following_id: params[:id]})
