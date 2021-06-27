class HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page]).reverse_order
  end

  def search
    @posts = Post.where(genre: params[:search]).page(1).per(5)
    # binding.irb
    render "top"
  end

  def about
  end
end
