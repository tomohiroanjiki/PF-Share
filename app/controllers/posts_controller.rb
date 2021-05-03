class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    redirect_to homes_top_path
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :genre, :contents)
  end
end
