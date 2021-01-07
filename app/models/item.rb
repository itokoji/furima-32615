class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delovery_id
    validates :item_price
  end
end