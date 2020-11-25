require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '出品する商品の情報の保存' do
      context '保存ができる場合' do
        it '全ての項目が存在すれば登録できる。' do
          expect(@item).to be_valid
        end
      end

      context '保存ができない場合' do
        it 'item_nameが空だと登録できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it 'item_explainが空では登録できない' do
          @item.item_explain = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item explain can't be blank")
        end
        it 'category_idが1では登録できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it 'status_idが1では登録できない' do
          @item.status_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end
        it 'delivery_fee_idが1では登録できない' do
          @item.delivery_fee_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
        end
        it 'delivery_zone_idが1では登録できない' do
          @item.delivery_zone_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery zone must be other than 1")
        end
        it 'delivery_time_idが1では登録できない' do
          @item.delivery_time_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
        end
        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが半角数字でないと登録できない' do
          @item.price = '１２３４５'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceの値が300以下では登録できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceの値が9999999以上では登録できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it 'imageが空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "ユーザーが紐付いていないと出品商品情報は保存できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
  end
end