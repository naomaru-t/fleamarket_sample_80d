require 'rails_helper'

describe User do
  describe '#create' do
    it "nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kanaが存在すれば登録できること" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    it "nicknameがない場合は登録できないこと" do
      user = FactoryBot.build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "emailがない場合は登録できないこと" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = FactoryBot.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "passwordがない場合は登録できないこと" do
      user = FactoryBot.build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = FactoryBot.build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "passwordとpassword_confirmationが一致しない場合は登録できないこと" do
      user = FactoryBot.build(:user, password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "passwordが6文字未満であれば登録できないこと" do
      user = FactoryBot.build(:user, password: "12345")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
    it "passwordが6文字以上であれば登録できること" do
      user = FactoryBot.build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end
    
  end
end
