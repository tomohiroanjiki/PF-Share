class RelationshipsController < ApplicationController

  def follow
    @customer = Customer.find(params[:id])
    current_customer.follow(params[:id])
  end

  def unfollow
    @customer = Customer.find(params[:id])
    current_customer.unfollow(params[:id])
  end
end
