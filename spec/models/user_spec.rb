require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとlast_nameとfirst_name、last_name_kanaとfirst_name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it"last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
     expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it "first_name_kanaが空ではできない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end

    it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = ''
      @user.valid?
      
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
   
    it "お名前カナ(全角)は、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana = ''
      @user.valid?
      
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it "お名前カナ(全角)は、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = ''
      @user.valid?
      
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "passwordが5文字以下では登録できない" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = 'AAAAAA'
      @user.valid?
      
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = '123344'
      @user.valid?
      
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = 'asssdsa'
      @user.valid?
      
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end


  end
end
end