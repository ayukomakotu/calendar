require 'rails_helper'

RSpec.describe "AppointsList", type: :system do
    let!(:user1)  { FactoryBot.create(:user1) }
    let!(:sample_user)  { FactoryBot.create_list(:sample_user, 10) }


    it "タイトルが表示されているか,アクセスが正しくできるか" do 
        log_in_system(user1)
        visit appoints_path
        expect(current_path).to eq appoints_path
    end

    it "ユーザーが表示されているか" do
        log_in_system(user1)
        visit appoints_path
        User.all.each do |user|
            expect(page).to have_content user.name
        end
    end

    it "予定を正しく追加できるか" do
        log_in_system(user1)
        visit appoints_path
        first(".new").click
        expect(current_path).to eq new_appoint_path
        # 新しくappointを作成する
        fill_in "appoint[name]", with: "田中"
        fill_in "appoint[address]", with: "松江" 
        fill_in "appoint[telephone]", with: "xxx-xxxx"
        fill_in "appoint[day]", with: Date.today
        fill_in "appoint[time]", with: "09:00"
        fill_in "appoint[kind]", with: "推進"
        click_button "追加"
        # appoints/indexにリダイレクトしているか
        expect(current_path).to eq appoints_path
        # フラッシュメッセージが表示されているか
        # expect(page).to "予定を追加しました"
        # 新しいappointが表示されているか
        expect(page).to have_content "田中"
        expect(page).to have_content "松江"
        expect(page).to have_content "xxx-xxxx"
        expect(page).to have_content "09:00"
        expect(page).to have_content "推進"
    end 
end