class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create!
    redirect_to edit_post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    @body = MARKDOWN.render(@post.body)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end


