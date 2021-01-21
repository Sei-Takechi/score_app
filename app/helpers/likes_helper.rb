module LikesHelper

  def already_liked?(post)
    current_user.likes.exists?(post_id: post.id)
  end

  def render_likes(post)
    if already_liked?(post)
      render 'likes/unlike', { post: post } 
    else 
      render 'likes/like', { post: post } 
    end 
  end

end
