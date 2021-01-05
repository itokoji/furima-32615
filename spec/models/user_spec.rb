require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameがない場合は登録できないこと" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailがない場合は登録できないこと" do
      user = FactoryBot.build(:user)
      user.email = ""  
      user.valid?
      expect(user.errors.full_messages).to include ("Email can't be blank")
    end
    it "passwordがない場合は登録できないこと" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include ("Password can't be blank")
    end
    it "encrypted_passwordがない場合は登録できないこと" do
      user = FactoryBot.build(:user)
      user.encrypted_password = ""
      user.valid?
      expect(user.errors.full_messages).to include ("Encrypted password can't be blank")
    end
    it "passwordが5文字以下では登録できない" do
      user = FactoryBot.build(:user)
      user.password = "00000"
      user.password_confirmation = "00000"
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "last_nameがない場合は登録できないこと" do
      user = FactoryBot.build(:user)
      user.last_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameがない場合は登録できないこと" do
      user = FactoryBot.build(:user)
      user.first_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_name_kanaがない場合は登録できないこと" do
      user = FactoryBot.build(:user)
      user.last_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaがない場合は登録できないこと" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birth_dateがない場合は登録できないこと" do
      user = FactoryBot.build(:user)
      user.birth_date = ""
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end