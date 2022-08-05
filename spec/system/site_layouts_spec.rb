require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do

  let!(:user1) { FactoryBot.create(:user1) }

it "headerリンクが正しいか" do
    # log_in_system(user1) rails_helper内でメソッド化して使うと不安定になるため削除
    visit root_path
    click_link "ホーム"
    expect(current_path).to eq home_path
    click_link "ヘルプ"
    expect(current_path).to eq help_path  
    expect(page).not_to have_content "アカウント"

    click_on "ログイン"
    fill_in 'session[number]', with: 1000
    fill_in 'session[password]', with: "password"
    click_button 'ログイン'
    expect(page).not_to have_link "ログイン", href: login_path
    visit current_path #不安定なので追加
    find(".dropdown-toggle").click
    click_on "マイページ"
    expect(current_path).to eq user_path(user1)
    visit current_path
    find(".dropdown-toggle").click
    click_on "ログアウト"
    expect(page).to have_content "ログアウトしました"
  end

  it "home画面のリンクは正しいか" do
    visit login_path
    fill_in 'session[number]', with: 1000
    fill_in 'session[password]', with: "password"
    click_button 'ログイン'
    expect(current_path).to eq home_path
    click_on "施工予定表へ移動 »"
    expect(current_path).to eq events_path
    visit home_path
    click_on "見込み管理表へ移動 »"
    expect(current_path).to eq appoints_path
    visit home_path
    click_on "実績一覧へ移動 »"
    expect(current_path).to eq achievements_events_path
  end
end