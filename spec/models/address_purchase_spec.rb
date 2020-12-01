require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '購入者情報の保存' do
    before do
      @address_purchase = FactoryBot.build(:address_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@address_purchase).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @address_purchase.postal_code = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @address_purchase.postal_code = '１２３４５６７'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefectures_idが1では登録できないこと' do
      @address_purchase.prefectures_id = '1'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include('Prefectures must be other than 1')
    end
    it 'municipalitiesが空だと保存できないこと' do
      @address_purchase.municipalities = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @address_purchase.address = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it 'house_numberは空でも保存できること' do
      @address_purchase.house_number = nil
      expect(@address_purchase).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @address_purchase.phone_number = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにはハイフンは不要で、11桁以内でないと保存できないこと' do
      @address_purchase.phone_number = '０９０-１２３-４５６７８'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)", "Phone number is invalid")
    end
  end
end

