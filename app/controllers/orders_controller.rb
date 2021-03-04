class OrdersController < ApplicationController
  before_action :sold_out_item, only: [:index]

  def index
    @user_item = UserItem.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @user_item = UserItem.new(user_item_params)
    @item = Item.find(params[:item_id])
    if @user_item.valid?
      pay_item
      @user_item.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def user_item_params
    params.require(:user_item).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end 

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: user_item_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end

end