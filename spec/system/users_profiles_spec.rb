require 'rails_helper'

RSpec.describe "UsersProfiles", type: :system do
  before do
    @user = FactoryBot.create(:michael)
  end

  it "タイトルは正しいか" do
    visit user_path(@user)
    expect(page).to have_title @user.name
  end
  it "正しいユーザーの情報が表示されているか" do
    visit user_path(@user)
    expect(page).to have_content @user.name
  end
end
