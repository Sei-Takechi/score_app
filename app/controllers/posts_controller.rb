class PostsController < ApplicationController
  def new
    @post = current_user.posts.build if logged_in?
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def index
  end

  def create
    # 関連付けを行ったので、Userオブジェクトに対してpostを呼び出す
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to post_path(@post)
    else
      # errorも表示させる（未実装）
      render 'new'
    end

  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :file)
    end

end
