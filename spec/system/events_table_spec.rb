require 'rails_helper'

RSpec.describe "Event", type: :system do

    let!(:user1)  { FactoryBot.create(:user1) }
    let!(:item)   { FactoryBot.create(:item) }
    let!(:route)  { FactoryBot.create(:route) }
    
    it "非ログイン状態でログイン画面に戻される" do
        visit events_path
        visit current_path
        expect(current_path).to eq login_path
    end

    it "施工予定の追加ができるか、施工予定表の表示は正しいか" do
        visit login_path
        visit current_path #挙動がおかしくなるのでリロード
        #ログインする
        fill_in 'session[number]', with: 1000
        fill_in 'session[password]', with: "password"
        click_button 'ログイン'
        visit current_path #挙動がおかしくなるのでリロード

        visit events_path
        #formに値を入力して送信
        fill_in "event_form[last_name]", with: "sample_last_name"
        fill_in "event_form[first_name]", with: "sample_first_name"
        fill_in "event_form[address]", with: "sample_address"
        fill_in "event_form[telephone]", with: "sample_telephone"
        fill_in "event_form[start_time]", with: Date.today
        select "１号車", from: "event_form_car" #セレクトボックスのidを指定
        fill_in "event_form[start]", with: "2022-08-05 09:00:00 +0900"
        fill_in "event_form[finish]", with: "2022-08-05 09:00:00 +0900"
        select item.name, from: "event_form_item_id" #セレクトボックスのidを指定
        fill_in "event_form_number", with: 100
        fill_in "event_form_price",  with: 1000000
        select route.name, from: "event_form_route_id" #セレクトボックスのidを指定
        click_button "登録"
        save_and_open_page
        visit current_path

        #施工予定が追加され、正しく表示されているか
        expect(page).to include "sample_last_name"
        # expect(page).to include "sample_first_name"
        expect(page).to include "sample_address"
        # expect(page).to include "sample_telephone"
        expect(page).to include user1.name
        expect(page).to include item.name
        expect(page).to include "100"
        expect(page).to include item.unit
        expect(page).to include "1000000"
        expect(page).to include "09:00 - 11:00"
    end
end