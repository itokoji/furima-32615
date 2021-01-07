class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders
  
  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 6 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :last_name
      validates :first_name
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :birth_date
  end
end