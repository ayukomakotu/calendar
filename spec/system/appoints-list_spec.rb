require 'rails_helper'

RSpec.describe "AppointsList", type: :system do
    let!(:user1)  { FactoryBot.create(:user1) }
    let!(:sample_user)  { FactoryBot.create_list(:sample_user, 10) }


    describe "表示とアクセス" do
        before do
            log_in_system(user1)
            visit current_path
            click_on "見込み管理表へ移動 »"
            visit current_path
        end

        it "アクセスが正しくできるか" do 
            expect(current_path).to eq appoints_path
        end

        it "タイトルが表示されているか" do
            expect(page).to have_content "見込み管理表"
        end

        it "ユーザーが表示されているか" do
            User.all.each do |user|
                expect(page).to have_content user.name
            end
        end
    end

    describe "予定の追加" do
        
        before do
            log_in_system(user1)
            visit appoints_path
            first(".new").click
            visit current_path
        end


        it "appoints/newへのリンクが正しいか" do
            expect(current_path).to eq new_appoint_path
        end

        describe "パラメータが正常" do
            before do
                # 新しくappointを作成する
                fill_in "appoint[name]", with: "田中"
                fill_in "appoint[address]", with: "松江" 
                fill_in "appoint[telephone]", with: "xxx-xxxx"
                fill_in "appoint[day]", with: Date.today
                fill_in "appoint[time]", with: "09:00"
                fill_in "appoint[kind]", with: "推進"
                click_button "追加"
            end

            it "appointが新規作成されているか" do
                expect(page).to have_content "田中"
                expect(page).to have_content "松江"
                expect(page).to have_content "xxx-xxxx"
                expect(page).to have_content "09:00"
                expect(page).to have_content "推進"
            end

            it "リダイレクトは正しいか" do
                expect(current_path).to eq appoints_path
            end

            it "フラッシュメッセージが表示されているか" do
                expect(page).to have_content "予定を追加しました"
            end
        end

        describe "パラメータが不正" do

            before do 
                fill_in "appoint[name]", with: "   "
                fill_in "appoint[address]", with: "   " 
                fill_in "appoint[telephone]", with: "     "
                fill_in "appoint[day]", with: "    "
                fill_in "appoint[time]", with: "   "
                fill_in "appoint[kind]", with: "   "
                click_button "追加"
            end

            it "appointの新規作成が失敗するか" do
                visit appoints_path
                expect(page).not_to have_selector ".appoint"
            end

            it  "エラーメッセージが表示されているか" do
                expect(page).to have_selector "#error_explanation"
                # エラーメッセージのidを指定
            end
        end
    end
end