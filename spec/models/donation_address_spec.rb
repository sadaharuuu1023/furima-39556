require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      current_user = FactoryBot.create(:user)
      @donation_address = FactoryBot.build(:donation_address, user_id: @user.id, item_id: @item.id)
    end
    
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@donation_address).to be_valid
      end
      it 'building（建物名）は空でも保存できること' do
        @donation_address.building = ''
        expect(@donation_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_code（郵便番号）が空だと保存できないこと' do
        @donation_address.post_code = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @donation_address.post_code = '1234567'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_id（都道府県）を選択していないと保存できないこと' do
        @donation_address.prefecture_id = 0
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipality（市区町村）を入力していないと保存できないこと' do
        @donation_address.municipality = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'address（番地）を入力していないと保存できないこと' do
        @donation_address.address = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_number(電話番号)を入力していないと保存できないこと' do
        @donation_address.telephone_number = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'tokenを取得していないと保存できないこと' do
        @donation_address.token = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @donation_address.user_id = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @donation_address.item_id = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Item can't be blank")
      end

      it '電話番号にが全角数字が含まれると保存できないこと' do
        @donation_address.telephone_number = '123００678901'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Telephone number Invalid. Please enter only digits in half-width characters.")
      end
      it '電話番号が9桁以下では保存できないこと' do
        @donation_address.telephone_number = '123456789'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Telephone number Invalid. Please enter only digits in half-width characters.")
      end
      it '電話番号が12桁以上では保存できないこと' do
        @donation_address.telephone_number = '1234567890123'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Telephone number Invalid. Please enter only digits in half-width characters.")
      end
    end
  end