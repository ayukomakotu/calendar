require 'rails_helper'

RSpec.describe "AppointsList", type: :system do
    let!(:sample_office)  { FactoryBot.create(:sample_office) }
    let!(:user1)          { FactoryBot.create(:user1, office_id: sample_office.id) }
    let!(:sample_user)  { FactoryBot.create_list(:sample_user, 10, office_id: sample_office.id) }


    describe "表示とアクセス" do
        before do
            log_in_system(user1)
            # visit current_path 逆に不安定？
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
            visit current_path
            visit appoints_path
            visit current_path
            first(".new").click
            visit current_path
        end


        it "appoints/newへのリンクが正しいか" do
            expect(current_path).to eq new_appoint_path
        end

        describe "パラメータが正常な場合" do

            it "appointが新規作成されているか" do
                # 新しくappointを作成する
                fill_in "appoint[name]", with: "田中"
                fill_in "appoint[address]", with: "松江" 
                fill_in "appoint[telephone]", with: "xxx-xxxx"
                fill_in "appoint[day]", with: Date.today
                fill_in "appoint[time]", with: "09:00"
                fill_in "appoint[kind]", with: "推進"
                click_button "追加"
                expect(page).to have_content "田中"
                expect(page).to have_content "松江"
                expect(page).to have_content "xxx-xxxx"
                expect(page).to have_content "09:00"
                expect(page).to have_content "推進"
            end

            it "リダイレクトは正しいか" do
                # 新しくappointを作成する
                fill_in "appoint[name]", with: "田中"
                fill_in "appoint[address]", with: "松江" 
                fill_in "appoint[telephone]", with: "xxx-xxxx"
                fill_in "appoint[day]", with: Date.today
                fill_in "appoint[time]", with: "09:00"
                fill_in "appoint[kind]", with: "推進"
                click_button "追加"
                # visit current_path 逆に不安定？
                expect(current_path).to eq appoints_path
            end

            it "フラッシュメッセージが表示されているか" do
                # 新しくappointを作成する
                fill_in "appoint[name]", with: "田中"
                fill_in "appoint[address]", with: "松江" 
                fill_in "appoint[telephone]", with: "xxx-xxxx"
                fill_in "appoint[day]", with: Date.today
                fill_in "appoint[time]", with: "09:00"
                fill_in "appoint[kind]", with: "推進"
                click_button "追加"
                expect(page).to have_content "予定を追加しました"
            end
        end

        describe "パラメータが不正" do

            it "appointの新規作成が失敗するか" do
                fill_in "appoint[name]", with: "   "
                fill_in "appoint[address]", with: "   " 
                fill_in "appoint[telephone]", with: "     "
                fill_in "appoint[day]", with: "    "
                fill_in "appoint[time]", with: "   "
                fill_in "appoint[kind]", with: "   "
                click_button "追加"
                visit appoints_path
                expect(page).not_to have_selector ".appoint"
            end

            it  "エラーメッセージが表示されているか" do
                fill_in "appoint[name]", with: "   "
                fill_in "appoint[address]", with: "   " 
                fill_in "appoint[telephone]", with: "     "
                fill_in "appoint[day]", with: "    "
                fill_in "appoint[time]", with: "   "
                fill_in "appoint[kind]", with: "   "
                click_button "追加"
                expect(page).to have_selector "#error_explanation"
                # エラーメッセージのidを指定
            end
        end
    end
end