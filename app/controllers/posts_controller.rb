class PostsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = current_user.posts.build if logged_in?
  end

  def show
    @post = Post.find(params[:id])
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
      render 'new'
    end

  end

  def search
    # 検索文を変数に代入
    content = params[:search]

    if content
      @posts = Post.where("title LIKE ?", "%#{content}%")
    else
      @posts = Post.all
    end
    
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :file)
    end


end
