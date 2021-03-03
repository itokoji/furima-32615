class OrdersController < ApplicationController
  def index
    @user_item = UserItem.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @user_item = UserItem.new(user_item_params)
    @item = Item.find(params[:item_id])
    if @user_item.valid?
      @user_item.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def user_item_params
    params.require(:user_item).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id,item_id:params[:item_id])
  end 

end