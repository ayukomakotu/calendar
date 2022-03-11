require 'rails_helper'

RSpec.describe "UsersSignups", type: :system do
  pending("のちに実装")
    context "パラメータが無効な場合" do
    end
  end

  context "パラメータが有効な場合" do
    it "ユーザーが増えること" do
      visit new_user_registration_path
      expect do
        fill_in 'user[name]',                  with: 'test_name'
        fill_in 'user[email]',                 with: 'test@example.com'
        fill_in 'user[password]',              with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_on '新規登録'
      end.to change(User, :count).by(1)
    end
end
