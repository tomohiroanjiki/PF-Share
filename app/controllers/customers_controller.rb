class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @post = @customer.post
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path
  end

  def withdrawal
  end

  def withdrawal_update
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to homes_top_path
  end

  def followed
    @customer =Customer.find(params[:id])
    @customers =@customer.following_user
  end

  def followers
    @customer =Customer.find(params[:id])
    @customers =@customer.follower_user
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :profil_image)
  end
end
