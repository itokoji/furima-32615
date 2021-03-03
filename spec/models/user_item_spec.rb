require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_item = FactoryBot.build(:user_item, user_id: @user.id, item_id: @item.id)
    sleep 1
  end
  
  describe '購入の保存' do
    context "購入の保存がうまくいくとき" do
      it "全ての情報が存在すれば登録できる" do
        expect(@user_item).to be_valid
      end
    end

    context "購入の保存がうまくいかないとき" do
      it "郵便番号がないと保存できない" do
        @user_item.postal_code = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
      end

      it "都道府県がないと保存できない" do
        @user_item.prefecture_id = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefecture is not a number")
      end

      it "市区町村がないと保存できない" do
        @user_item.city = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("City can't be blank")
      end

      it "番地がないと保存できない" do
        @user_item.addresses = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Addresses can't be blank")
      end

      it "電話番号がないと保存できない" do
        @user_item.phone_number = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
      end

      it "郵便番号はハイフンがないと保存できない" do
        @user_item.postal_code = '1231234'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code is invalid")
      end

      it "都道府県が1であれば保存できない" do
        @user_item.prefecture_id = 1
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "電話番号はハイフンが不要で、11桁以内でないと保存できない" do
        @user_item.phone_number = '090123456789'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
