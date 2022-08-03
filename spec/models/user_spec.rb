require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1)  { FactoryBot.build(:user1) }

  it "userが有効になるか" do
    expect(user1).to be_valid
  end

  it "nameが空で無効" do
    user1.name = "   "
    expect(user1).to be_invalid
  end

  it "numberが空で無効" do
    user1.number = "   "
    expect(user1).to be_invalid
  end

  it "passwordが空で無効" do
    user1.password = "   "
    expect(user1).to be_invalid
  end

  it "password_confirmationが空で無効" do
    user1.password_confirmation = "   "
    expect(user1).to be_invalid
  end

  it "nameがuniqueであるか" do
    @dup_user = User.create(name: user1.name, number: 200,
                         password: "password",
                         password_confirmation: "password")
    expect(user1).to be_invalid
  end

  it "numberがuniqueであるか" do
    @dup_user = User.create(name: "dup_name", number: user1.number,
                         password: "password",
                         password_confirmation: "password")
    expect(user1).to be_invalid
  end

end
