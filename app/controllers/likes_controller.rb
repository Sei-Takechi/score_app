class LikesController < ApplicationController

  before_action :logged_in_user

  def update
    # ユーザーと投稿に紐づけてlikeを生成
    like = current_user.likes.build(post_id: params[:id])
    like.save
    # 直前のリクエストを参照
    redirect_to request.referer
  end

  def destroy
    like = current_user.likes.find_by(post_id: params[:id])
    like.delete
    # 直前のリクエストを参照
    redirect_to request.referer
  end

end
