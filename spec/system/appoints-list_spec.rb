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
    end 
end