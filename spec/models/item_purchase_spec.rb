require 'rails_helper'

# bundle exec rspec spec/models/item_purchase_spec.rb
# binding.pry

RSpec.describe ItemPurchase, type: :model do
  describe '#purchase' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end

    describe '商品購入' do 

      context '商品購入がうまくいくとき' do
        it '全項目が存在すれば登録できること' do
          expect(@item_purchase).to be_valid
        end

        it 'buildingが空でも登録できること' do
          @item_purchase.building = ''
          expect(@item_purchase).to be_valid
        end

      end

      context '商品購入がうまくいかないとき' do
        it 'postal_codeが空では登録できないこと' do
          @item_purchase.postal_code = ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank", 'Postal code が間違っています (-)が必要です')
        end

        it 'postal_codeが半角のハイフンを含んだ正しい形でないと登録できないこと' do
          @item_purchase.postal_code = '123ー4567'
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include('Postal code が間違っています (-)が必要です')
        end

        it 'prefecture_idが空では登録できないこと' do
          @item_purchase.prefecture_id = ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'prefecture_idが1では登録できないこと' do
          @item_purchase.prefecture_id = 1
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include('Prefecture must be other than 1')
        end

        it 'cityが空では登録できないこと' do
          @item_purchase.city = ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("City can't be blank")
        end

        it 'addressが空では登録できないこと' do
          @item_purchase.address = ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
        end

        it 'phone_numberが空では登録できないこと' do
          @item_purchase.phone_number = ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'phone_numberが11桁以下でないと登録できないこと' do
          @item_purchase.phone_number = '0001234567891011'
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include('Phone number が間違っています')
        end

        it 'phone_numberがハイフンがあると登録できないこと' do
          @item_purchase.phone_number = '000-0000-0000'
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include('Phone number が間違っています')
        end

        it 'phone_numberが正しい形式だとと登録できること' do
          @item_purchase.phone_number = '00010001000'
          expect(@item_purchase).to be_valid
        end

        it 'user_idが空では登録できないこと' do
          @item_purchase.user_id = ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空では登録できないこと' do
          @item_purchase.item_id = ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Item can't be blank")
        end

        it 'tokenが空だと登録できない' do
          @item_purchase.token = nil
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
        end

      end

    end
  end
end

