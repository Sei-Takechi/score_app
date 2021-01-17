class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :confirm_valid_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show
    @user = User.find(params[:id])
    @feed_items = @user.posts.paginate(page: params[:page], per_page: 5)
    # @posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      log_in(@user)
      flash[:success] = "スコアーズへようこそ！"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render 'edit'
    end

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  # loginしていなければログインフォームへ飛ばす
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインが必要です"
      redirect_to login_url
    end
  end

  # ユーザー本人であるかを確かめ、違う場合ホームへ飛ばす
  def confirm_valid_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = "権限がありません"
      redirect_to root_url
    end
  end

  # 管理者権限を持っているか確認する
  def admin_user
    unless current_user.admin?
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
