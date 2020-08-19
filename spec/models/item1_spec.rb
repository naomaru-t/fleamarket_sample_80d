require 'rails_helper'
describe Item do
  describe '#create' do

    it "全ての必須項目が入力されている場合出品できる" do
      item = FactoryBot.build(:item)
      expect(item).to be_valid
    end

    it "nameがないと出品できない" do
      item = FactoryBot.build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "introductionがないと出品できない" do
      item = FactoryBot.build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("can't be blank")
    end

    it "category_idがないと出品できない" do
      item = FactoryBot.build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "postagepayer_idがないと出品できない" do
      item = FactoryBot.build(:item, postagepayer_id: nil)
      item.valid?
      expect(item.errors[:postagepayer_id]).to include("can't be blank")
    end

    it "postagetype_idがないと出品できない" do
      item = FactoryBot.build(:item, postagetype_id: nil)
      item.valid?
      expect(item.errors[:postagetype_id]).to include("can't be blank")
    end

    it "prefecture_idがないと出品できない" do
      item = FactoryBot.build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "sellstatus_idがないと出品できない" do
      item = FactoryBot.build(:item, sellstatus_id: nil)
      item.valid?
      expect(item.errors[:sellstatus_id]).to include("can't be blank")
    end

    it "preparationdays_idがないと出品できない" do
      item = FactoryBot.build(:item, preparationdays_id: nil)
      item.valid?
      expect(item.errors[:preparationdays_id]).to include("can't be blank")
    end

    it "priceがないと出品できない" do
      item = FactoryBot.build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "saler_idがないと出品できない" do
      item = FactoryBot.build(:item, saler_id: nil)
      item.valid?
      expect(item.errors[:saler_id]).to include("can't be blank")
    end

    #     わからない
    # it "imageがないと出品できない" do
    #   item = FactoryBot.build(:item, image_id: nil)
    #   item.valid?
    #   expect(item.errors[:image_id]).to include("can't be blank")
    # end

    it "nameが40字以上だと出品できない" do #↓42文字
      item = FactoryBot.build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "nameが40字以内だと出品できる" do #↓39文字
      item = FactoryBot.build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(item).to be_valid
    end

    it "introductionが1000字以上だと出品できない" do #↓1001文字
      item = FactoryBot.build(:item, introduction: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:introduction]).to include("is too long (maximum is 1000 characters)")
    end

    it "introductionが1000字以内だと出品できる" do #↓999文字
      item = FactoryBot.build(:item, introduction: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(item).to be_valid
    end

    it "priceが300以下だと出品できない" do
      item = FactoryBot.build(:item, price: 300)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than 300")
    end

    it "priceが301以上だと出品できる" do #↓39文字
      item = FactoryBot.build(:item, price: 301)
      expect(item).to be_valid
    end

    it "priceが9999999以上だと出品できない" do
      item = FactoryBot.build(:item, price: 9999999)
      item.valid?
      expect(item.errors[:price]).to include("must be less than 9999999")
    end

    it "priceが9999998以下だと出品できる" do #↓39文字
      item = FactoryBot.build(:item, price: 9999998)
      expect(item).to be_valid
    end

  end
end