require 'rails_helper'

# bundle exec rspec spec/models/item_spec.rb
# binding.pry

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "item_nameとexplanation、category_idとcondition_id 、first_nameとlast_name,last_kanaとfirst_kana,birthday,imageが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "item_nameが空では登録できないこと" do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it "explanationが空では登録できないこと" do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "condition_idが空では登録できないこと" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "shipping_charge_id が空では登録できないこと" do
      @item.shipping_charge_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end

    it "prefectures_idが空では登録できないこと" do
      @item.prefectures_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures can't be blank")
    end

    it "purchase_to_day_idが空では登録できないこと" do
      @item.purchase_to_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Purchase to day can't be blank")
    end

    it "valueが空では登録できないこと" do
      @item.value = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Value can't be blank")
    end

    it "valueが300以下では登録出来ないこと" do
      @item.value = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Value must be greater than or equal to 300")
    end

    it "valueが9999999以上では登録出来ないこと" do
      @item.value = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Value must be less than or equal to 9999999")
    end

    it "valueが半角以外では登録出来ないこと" do
      @item.value = "あア亜"
      @item.valid?
      expect(@item.errors.full_messages).to include("Value is not a number")
    end

    it "category_idがID1の[---]を選択すると登録出来ないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "condition_idがID1の[---]を選択すると登録出来ないこと" do
      @item.condition_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "shipping_charge_idがID1の[---]を選択すると登録出来ないこと" do
      @item.shipping_charge_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end

    it "shipping_charge_idがID1の[---]を選択すると登録出来ないこと" do
      @item.prefectures_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
    end

    it "purchase_to_day_idがID1の[---]を選択すると登録出来ないこと" do
      @item.purchase_to_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Purchase to day must be other than 1")
    end

  end
end 
