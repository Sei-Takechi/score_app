module SessionsHelper

  def log_in(user)
    # sessionというハッシュの:user_idキーにuser.idを代入するイメージ
    session[:user_id] = user.id
  end

  # 現在のユーザーを取得するメソッド
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # loginしていればtrue,していなければfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # logoutの処理
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
