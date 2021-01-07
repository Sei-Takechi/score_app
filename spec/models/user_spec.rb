require 'rails_helper'

RSpec.describe User, type: :model do

  # user の定義
  let(:user) { FactoryBot.create(:user) }

  describe "有効な登録" do
    it "ユーザー名とメールアドレスがある場合有効" do
      expect(user).to be_valid
    end
  end

  describe "メールアドレス" do
    it "メールアドレスを小文字にして保存" do
      user.email = "ExaMpLe@eXAMple.com"
      user.save
      expect(user.email).to eq "example@example.com"
    end
    it "メールアドレスがない場合無効" do
      user.email = ""
      expect(user).not_to be_valid
    end
    it "メールアドレスが255字を超える場合無効" do
      user.email = "a" * 244 + "@example.com"
      expect(user).not_to be_valid
    end
    it "メールアドレスが重複している場合無効" do
      expect(FactoryBot.build(:user, name: "foo", email: user.email.upcase)).not_to be_valid
    end
  end

  describe "ユーザー名" do
    it "ユーザー名がない場合無効" do
      user.name = ""
      expect(user).not_to be_valid
    end
    it "ユーザー名が30字を超える場合無効" do 
      user.name = "a" * 31
      expect(user).not_to be_valid
    end
  end

  describe "パスワード" do

    it "パスワードがない場合無効" do
      user.password = user.password_confirmation = ""
      expect(user).not_to be_valid
    end

    it "最小文字数を下回ると無効" do
      user.password = user.password_confirmation = "aaa"
      expect(user).not_to be_valid
    end
  end

end
