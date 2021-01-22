class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_url
    else
      flash.now[:danger] = "入力された情報に誤りがあります"
      # userインスタンスを初期化
      @user = User.new
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
