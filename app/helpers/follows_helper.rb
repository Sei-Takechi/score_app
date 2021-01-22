module FollowsHelper

  def already_following?(user)
      current_user.active_follows.exists?(followed_id: user.id)
  end

  def render_follow(user)
    if already_following?(user) 
      render 'follows/follow'
    else 
      render 'follows/unfollow'
    end
  end

end
