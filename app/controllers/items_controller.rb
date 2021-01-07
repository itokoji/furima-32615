class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delovery_id, :item_price)
  end
end