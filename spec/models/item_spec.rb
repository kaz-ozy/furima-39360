require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報を入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力がうまくいかない時' do
      it 'imageが空だと出品できない' do
      @item.image = nil
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
 
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Price Can't be blank", "Price is invalid", "Price is not a number"
      end

      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it 'priceが設定範囲以外だと出品できない' do
        @item.price = 100000000
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'categoryが未選択だと出品できない' do 
        @item.category_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      
      it 'conditionが未選択だと出品できない' do 
        @item.condition_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      
      it 'chargeが未選択だと出品できない' do 
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end

      it 'prefectureが未選択だと出品できない' do 
        @item.prefecture_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'days_shipが未選択だと出品できない' do  
        @item.days_ship_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include "Days ship can't be blank"
      end
    end
  end
end


# binding.pry  止める構文