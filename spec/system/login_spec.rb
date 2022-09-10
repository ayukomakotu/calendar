require 'rails_helper'

RSpec.describe "Login", type: :system do
    let!(:sample_office)  { FactoryBot.create(:sample_office) }
    let!(:user1)          { FactoryBot.create(:user1, office_id: sample_office.id) }

    describe "有効な値の場合" do

        it "ログインが成功する" do
            visit login_path 
            fill_in 'session[number]', with: 1000
            fill_in 'session[password]', with: "password"
            click_button 'ログイン'
            expect(page).to have_content 'ログインに成功しました'
            visit current_path
            expect(current_path).to eq home_path
        end

        # it "フレンドリーフォワーディングが機能しているか" do
        #     visit appoints_path
        #     # visit current_path
        #     expect(current_path).to eq login_path
        #     fill_in 'session[number]', with: 1000
        #     fill_in 'session[password]', with: "password"
        #     click_button 'ログイン'
        #     visit current_path
        #     expect(current_path).to eq appoints_path
        # end
    end

    describe "無効な値の場合" do
        it "ログインが成功しない" do
            visit login_path
            fill_in 'session[number]', with: 100
            fill_in 'session[password]', with: "invalid"
            click_button 'ログイン'
            expect(current_path).to eq login_path
            expect(page).to have_content '番号またはパスワードが間違っています'
        end
    end

    it "ログアウト機能が機能しているか" do
        visit login_path 
        fill_in 'session[number]', with: 1000
        fill_in 'session[password]', with: "password"
        click_button 'ログイン'
        visit current_path
        find(".dropdown-toggle").click
        click_on "ログアウト"
        expect(page).to have_content "ログアウトしました"
        expect(current_path).to eq login_path
    end
end