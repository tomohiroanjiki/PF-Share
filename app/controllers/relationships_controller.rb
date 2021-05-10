class RelationshipsController < ApplicationController

  def follow
    current_customer.follow(params[:id])
    redirect_to customers_path
  end

  def unfollow
    current_customer.unfollow(params[:id])
    redirect_to customers_path
  end
end
