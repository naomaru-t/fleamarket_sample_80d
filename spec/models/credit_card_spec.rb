require 'rails_helper'
describe CreditCard do
  describe '#create' do
    it "user_id、customer_id、card_idが存在すれば登録できること" do
      credit_card = FactoryBot.build(:credit_card)
      expect(credit_card).to be_valid
    end
    it "customer_idがない場合は登録できないこと" do
      credit_card = FactoryBot.build(:credit_card, customer_id: "")
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("can't be blank")
    end
    it "customer_idが存在すれば登録できること" do
      credit_card = FactoryBot.build(:credit_card, customer_id: "qrltuvwxyz")
      expect(credit_card).to be_valid
    end
    it "card_idがない場合は登録できないこと" do
      credit_card = FactoryBot.build(:credit_card, card_id: "")
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("can't be blank")
    end
    it "card_idが存在すれば登録できること" do
      credit_card = FactoryBot.build(:credit_card, card_id: "qrltuvwxyz")
      expect(credit_card).to be_valid
    end
  end
end
