require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it "入力があれば保存ができること" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it "postal_codeが空では登録できないこと" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it "postal_codeがハイフン無しでは登録できないこと" do
      @order.postal_code = 1234567
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it "prefecture_idが空では登録できないこと" do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "municipalitiesが空では登録できないこと" do
      @order.municipalities = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipalities can't be blank")
    end
    it "addressが空では登録できないこと" do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it "telephone_numberが空では登録できないこと" do
      @order.telephone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone numbe can't be blank")
    end
    it "telephone_numberにハイフンをつけると登録できないこと" do
      @order.telephone_number = 090-1234-5678
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number is invalid. Include hyphen(-)")
    end

end
