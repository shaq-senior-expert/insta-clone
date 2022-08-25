class LikesController < ApplicationController
  def save_like
    # @like = Like.new(post_id: params[:post_id], user_id: current_user.id)
    @post_id = params[:post_id]
    # existing_like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like = Like.new(post_id: @post_id, user: current_user)
    @existing_like = current_user.post_like(@post_id)
    # binding.pry
    respond_to do |format|
      format.js {
        if @existing_like
          # @existing_like.destroy
          destroy()
          @success = false
        elsif
 # @like.save
          create()
          @success = true
        else
          @success = false
        end
        @post_likes = Post.find(@post_id).total_likes
        render "posts/like"
      }
    end
  end

  def create
    @like.save
  end

  def destroy
    @existing_like.destroy
  end

  def list
    # get list of users who liked the post
    # ids = Like.where(post_id: params[:id]).map { |i| i.user_id }
    # @users = User.where(id: ids)

    @users = User.all_liking_post(params[:id])
  end
end
