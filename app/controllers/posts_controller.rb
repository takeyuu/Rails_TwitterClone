class PostsController < ApplicationController
  before_action :select_post, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    @post.id = params[:id]
    render :new if @post.invalid?
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: 'つぶやきました'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if params[:back]
      render :edit
    else
      if @post.update(post_params)
        redirect_to posts_path, notice: 'つぶやきを編集しました'
      else
        render :edit
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'つぶやきを削除しました'
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def select_post
    @post = Post.find(params[:id])
  end
end
