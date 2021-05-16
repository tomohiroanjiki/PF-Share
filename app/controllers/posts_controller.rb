class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(",")
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    tag_list = params[:post][:tag_ids].split(',')
    if @post.save
      @post.save_tags(tag_list)
      flash[:success] = '投稿しました！'
      redirect_to homes_top_path
    else
      render action: 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_ids].split(',')
    if @post.update_attributes(post_params)
      @post.save_tags(tag_list)
      flash[:success] = '投稿を編集しました！！'
      redirect_to post_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to edit_customer_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :genre, :contents)
  end
end
