require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの保存' do
    context "アイテムの保存がうまくいくとき" do
      it "全ての情報が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "アイテムの保存がうまくいかないとき" do
      it "出品画像がないとアイテムは保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないとアイテムは保存できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "商品の説明がないとアイテムは保存できない" do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it "カテゴリーがないとアイテムは保存できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "商品の状態がないとアイテムは保存できない" do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status is not a number")
      end
      it "配送料の負担がないとアイテムは保存できない" do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status is not a number")
      end
      it "発送元の地域がないとアイテムは保存できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "発送までの日数がないとアイテムは保存できない" do
        @item.scheduled_delovery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delovery is not a number")
      end
      it "販売価格がないとアイテムは保存できない" do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it "ユーザーが紐付いていないとアイテムは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it "カテゴリーが1であれば保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が1であれば保存できない" do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end
      it "配送料の負担が1であれば保存できない" do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end
      it "発送元の地域が1であれば保存できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数が1であれば保存できない" do
        @item.scheduled_delovery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delovery must be other than 1")
      end
      it "全角文字ではアイテムプライスは保存できない" do
        @item.item_price = 'ABC'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not included in the list")
      end
      it "半角英数混合ではアイテムプライスは保存できない" do
        @item.item_price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not included in the list")
      end
      it "半角英語だけではアイテムプライスは保存できない" do
        @item.item_price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not included in the list")
      end
      it "299円以下ではアイテムプライスは保存できない" do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not included in the list")
      end
      it "10,000,000以上ではアイテムプライスは保存できない" do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not included in the list")
      end
    end
  end
end
