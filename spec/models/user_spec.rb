require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it '全ての項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    
    
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it 'yearが存在しない場合登録できない' do
      @user.year= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Year can't be blank")
    end

    it 'introductionが存在しない場合登録できない' do
      @user.introduction =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Introduction can't be blank")
    end

    
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに＠がない場合登録できない' do
      @user.email = 'email.email'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
  @user.password_confirmation = '00000'
  @user.valid?
  expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation ='000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが全角では登録できないこと' do
      @user.password = 'ｚｅｎｎｋａｋｕ'
      @user.password_confirmation =  'ｚｅｎｎｋａｋｕ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
  end
end
end
