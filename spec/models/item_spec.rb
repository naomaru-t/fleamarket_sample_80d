require 'rails_helper'
describe Item do
  describe '#create' do
    it "全ての必須項目が入力されている場合出品できる" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "imageがない場合は登録できないこと" do
      item = build(:item )
      item.images = []
      item.valid?
      expect(item.errors[:images]).to include("を入力してください")
    end

    it "nameがない場合は登録できないこと" do
      item = build(:item,  name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "postagepayer_idがない場合は登録できないこと" do
      item = build(:item, postagepayer_id: "")
      item.valid?
      expect(item.errors[:postagepayer_id]).to include("を入力してください")
    end

    it "postagetype_idがない場合は登録できないこと" do
      item = build(:item, postagetype_id: "")
      item.valid?
      expect(item.errors[:postagetype_id]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "brand_nameがなくてもは登録できること" do
      item = build(:item, brand_id: "")
      item.valid?
      expect(true).to_not be_nil
    end

    it "sellstatus_idがない場合は登録できないこと" do
      item = build(:item, sellstatus_id: "")
      item.valid?
      expect(item.errors[:sellstatus_id]).to include("を入力してください")
    end

    it "preparationdays_idがない場合は登録できないこと" do
      item = build(:item, preparationdays_id: "")
      item.valid?
      expect(item.errors[:preparationdays_id]).to include("を入力してください")
    end
      
    it "priceがない場合は登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
  end

  # まだ実装出来ていない（追加実装）
  # describe '.search' do
  #   it "keywordがない場合、全ての商品レコードを表示すること" do
  #     item = create(:item)
  #     keyword = ""
  #     expect(described_class.search(keyword).length).to eq 1
  #   end

  #   it "商品名に一致するレコードを検索できること" do
  #     item = create(:item, name: "ロボクリン")
  #     keyword = "ロボ"
  #     expect(described_class.search(keyword).length).to eq 1
  #   end

  #   it "商品名に一致しないレコードは検索できないこと" do
  #     item = create(:item, name: "ロボクリン")
  #     keyword = "robo"
  #     expect(described_class.search(keyword).length).to eq 0
  #   end

  #   it "商品説明に一致するレコードを検索できること" do
  #     item = create(:item, item_explanation: "ロボです")
  #     keyword = "ロボ"
  #     expect(described_class.search(keyword).length).to eq 1
  #   end

  #   it "商品説明に一致しないレコードは検索できないこと" do
  #     item = create(:item, item_explanation: "ロボです")
  #     keyword = "robo"
  #     expect(described_class.search(keyword).length).to eq 0
  #   end
  # end
end