class FollowsController < ApplicationController
  
  before_action :logged_in_user, only: [:update, :destroy]

  def followed
    @title = "フォロワー"
    @user = User.find(params[:id])
    @follows = @user.followers
    render 'follows/index'
  end

  def following
    @title = "フォロー"
    @user = User.find(params[:id])
    @follows = @user.following
    render 'follows/index'
  end
  
  def update
    follow = current_user.active_follows.build(followed_id: params[:id])
    follow.save
    redirect_to request.referer
  end

  def destroy
    follow = current_user.active_follows.find_by(followed_id: params[:id])
    follow.delete
    redirect_to request.referer
  end

end
