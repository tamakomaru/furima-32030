require 'rails_helper'
# bundle exec rspec spec/models/user_spec.rb
# binding.pry

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name,last_kanaとfirst_kana,birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailは、@を含む必要があること" do
      @user.email = "testgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "p123456"
      @user.password_confirmation = "p123456"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "p1234"
      @user.password_confirmation = "p1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "p123456"
      @user.password_confirmation = "p1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordに英字を含めないと登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "passwordに数字を含めないと登録できないこと" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
  

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameが半角だと登録できないこと" do
      @user.last_name = "aaa111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが半角だと登録できないこと" do
      @user.first_name = "aaa111"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end


    it "last_kanaが空では登録できないこと" do
      @user.last_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end

    it "last_kanaがカタカナ以外では登録できないこと" do
      @user.last_kana = "あ阿"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana カタカナ(全角)を使用してください")
    end



    it "first_kanaが空では登録できないこと" do
      @user.first_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end

    it "first_kanaがカタカナ以外では登録できないこと" do
      @user.first_kana = "あ阿"
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana カタカナ(全角)を使用してください")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end