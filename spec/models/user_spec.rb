require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:michael)
  end

  context 'validates :name' do
    it 'userが有効になるか' do
      expect(@user).to be_valid
    end

    it 'nameが空欄だと無効になるか' do
      @user.name = "    "
      expect(@user).to be_invalid
    end

    it 'nameが50文字以上で無効になるか' do
      @user.name = "a" * 51
      expect(@user).to be_invalid
    end

    it 'nameの一意性は担保されているか' do
      @other = User.create(name: "Michael Example", 
                        email: "user@example.com",
                        password: "foobar", 
                        password_confirmation: "foobar")
      expect(@user).to be_invalid
    end
  end
  
  context "validates :email" do
    it "emailが空欄だと無効になるか" do
      @user.email = "   "
      expect(@user).to be_invalid
    end

    it "emailが256文字以上で無効になるか" do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).to be_invalid
    end

    it "指定したemailのフォーマットは有効になっているか" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end

    it "emailの一意性が担保されているか" do
      duplicate_user = User.new(name: "test email unique", 
                              email: "michael@example.com",
                              password: "foobar", 
                              password_confirmation: "foobar")
      @user.save
      expect(duplicate_user).to be_invalid
    end
  end

  context "validates :password" do
    it "passwordが空白の場合無効になるか" do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).to be_invalid
    end

    it "passwordが短すぎる場合無効になるか" do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user).to be_invalid
    end
  end
end
