require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
      before do
        @user = FactoryBot.build(:user)
      end

      describe "ユーザー新規登録" do
        context '新規登録がうまくいくとき' do
          it "全ての項目が存在すれば登録できる。" do
            expect(@user).to be_valid
          end
          it "passwordが6文字以上であれば登録できる" do
            @user.password = "000000"
            @user.password_confirmation = "000000"
            expect(@user).to be_valid
          end
      end

        context '新規登録がうまくいかないとき' do
          it "nicknameが空だと登録できない" do
            @user.nickname = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Nickname can't be blank")
          end
          it "emailが空では登録できない" do
            @user.email = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Email can't be blank")    
          end
          it "重複したemailが存在する場合登録できない" do
            @user.save
            another_user = FactoryBot.build(:user, email: @user.email)
            another_user.valid?
            expect(another_user.errors.full_messages).to include("Email has already been taken")
          end
          it "passwordが空では登録できない" do
            @user.password = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Password can't be blank")
          end
          it "passwordが5文字以下であれば登録できない" do
            @user.password = "xxxxx"
            @user.password_confirmation = "xxxxx"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
          end
          it "passwordが存在してもpassword_confirmationが空では登録できない" do
            @user.password_confirmation = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
          end
          it "last_nameが空では登録できない" do
            @user.last_name = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
          end
          it "last_nameが全角ではないと登録できない" do
            @user.last_name = "ｱｲｳｴｵ"
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name is invalid")
          end
          it "first_nameが空では登録できない" do
            @user.first_name = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
          end
          it "first_nameが全角ではないと登録できない" do
            @user.first_name = "ｱｲｳｴｵ"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name is invalid")
          end
          it "last_name_huriganaが空では登録できない" do
            @user.last_name_hurigana = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name hurigana can't be blank", "Last name hurigana is invalid")
          end
          it "last_name_huriganaが全角カタカナでないと登録できない" do
            @user.last_name_hurigana = "あいうえお"
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name hurigana is invalid")
          end
          it "first_name_huriganaが空では登録できない" do
            @user.first_name_hurigana = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("First name hurigana can't be blank", "First name hurigana is invalid")
          end
          it "first_name_huriganaが全角カタカナでないと登録できない" do
            @user.first_name_hurigana = "あいうえお"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name hurigana is invalid")
          end
          it "birthdayが空では登録できない" do
            @user.birthday = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Birthday can't be blank")
          end
        end
      end
    end
  end
