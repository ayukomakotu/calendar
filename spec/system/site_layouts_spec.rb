require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do

  let!(:sample_office)  { FactoryBot.create(:sample_office) }
  let!(:user1)          { FactoryBot.create(:user1, office_id: sample_office.id) }
  let!(:sample_target)  { FactoryBot.create(:sample_target, user_id: user1.id) }
  let!(:sample_target2)  { FactoryBot.create(:sample_target, office_id: sample_office.id) }


it "headerリンクが正しいか" do
    # log_in_system(user1) rails_helper内でメソッド化して使うと不安定になるため削除
    visit root_path
    click_link "ホーム"
    expect(current_path).to eq home_path
    click_link "ヘルプ"
    expect(current_path).to eq help_path  
    expect(page).not_to have_content "アカウント"
  end

  it "home画面のリンクは正しいか" do
    log_in_system(user1)
    # visit current_path
    click_on "施工予定表へ移動 »"
    expect(current_path).to eq events_path
    visit home_path
    click_on "見込み管理表へ移動 »"
    expect(current_path).to eq appoints_path
    visit home_path
    click_on "実績へ移動 »"
    expect(current_path).to eq achievements_path
  end
end