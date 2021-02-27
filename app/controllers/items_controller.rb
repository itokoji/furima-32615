class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_path, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to  root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delovery_id, :item_price,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_path
    if @item.user != current_user
      redirect_to  root_path
    end
  end
end