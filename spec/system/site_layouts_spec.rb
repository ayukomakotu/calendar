require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do

  before do
    @user = FactoryBot.create(:michael)
  end

  context "headerのリンク" do
    it "homeへのリンクがあるか" do
      visit root_path
      expect(page).to have_link 'ホーム', href: home_path
    end

    it "helpへのリンクがあるか" do
      visit root_path
      expect(page).to have_link 'ヘルプ', href: help_path
    end

    it "sign_inへのリンクがあるか" do
      visit root_path
      expect(page).to have_link 'ログイン',
          href: new_user_session_path
    end

    
  end

  context "home画面のリンク" do

    it "sign_upへのリンクがあるか" do
      visit root_path
      expect(page).to have_link '新規登録', 
          href: new_user_registration_path
    end
  end
end
