require 'rails_helper'

RSpec.describe "AchievmentsIndex", type: :system do
    let!(:sample_office)   { FactoryBot.create(:sample_office)}
    let!(:sample_office2)  { FactoryBot.create(:sample_office2)}
    let!(:user1)           { FactoryBot.create(:user1, office_id: sample_office.id) }
    let!(:user2)           { FactoryBot.create(:user2, office_id: sample_office2.id) }
    let!(:user3)           { FactoryBot.create(:user3, office_id: sample_office.id) }
    let!(:customer)        { FactoryBot.create(:customer)}
    let!(:item)            { FactoryBot.create(:item) }
    let!(:route)           { FactoryBot.create(:route)}
    let!(:event)           { FactoryBot.create(:event, user_id: user1.id, customer_id: customer.id)}
    let!(:event2)          { FactoryBot.create(:event2, user_id: user1.id, customer_id: customer.id)}
    let!(:event3)          { FactoryBot.create(:event3, user_id: user3.id, customer_id: customer.id)}
    let!(:order)           { FactoryBot.create(:order, user: user1, item: item, route: route, event: event)}
    let!(:order2)          { FactoryBot.create(:order2, user: user1, item: item, route: route, event: event2)}
    let!(:order3)          { FactoryBot.create(:order3, user: user3, item: item, route: route, event: event3)}
    let!(:sample_target)   { FactoryBot.create(:sample_target, office_id: sample_office.id)}
    let!(:sample_target2)  { FactoryBot.create(:sample_target2, office_id: sample_office2.id)}
    let!(:sample_target3)  { FactoryBot.create(:sample_target3, user_id: user1.id)}
    let!(:sample_target4)  { FactoryBot.create(:sample_target4, user_id: user2.id)}
    let!(:sample_target5)  { FactoryBot.create(:sample_target5, user_id: user3.id)}

    describe "表示とアクセス" do
        before do
            log_in_system(user1)
            click_on "実績へ移動 »"
            visit current_path
        end

        it "アクセスが正しくできるか" do 
            expect(current_path).to eq achievements_path
        end

        it "タイトルが表示されているか" do
            expect(page).to have_content "実績"
        end

        it "ユーザーが表示されているか" do
            User.where(office_id: sample_office.id).each do |user|
                expect(page).to have_content user.name
            end
        end

        describe "当日受注表" do
            it "当日売上が反映されているか" do
                expect(page).to have_selector ".month", text: 100000
            end

            it "月累計が反映されているか" do
                expect(page).to have_selector ".month", text: 300000
            end
            it "目標が反映されているか" do
                expect(page).to have_selector ".month", text: 1000000
            end
            it "不足が反映されているか" do
                expect(page).to have_selector ".month", text: "-700000"
            end
            it "達成率が反映されているか" do
                expect(page).to have_selector ".month", text: "30.0%"
            end

            it "全体当日売上が反映されているか" do
                expect(page).to have_selector ".month", text: 500000
            end
            it "全体月累計が反映されているか" do
                expect(page).to have_selector ".month", text: 700000
            end
            it "全体目標が反映されているか" do
                expect(page).to have_selector ".month", text: 31000000
            end
            it "全体不足が反映されているか" do
                expect(page).to have_selector ".month", text: -30300000
            end
            it "全体達成率が反映されているか" do
                expect(page).to have_selector ".month", text: "2.25%"
            end

            it "他営業所へ移動できるか" do
                find("a", text: sample_office2.name).click
                expect(page).to have_content "sample_office2営業所"
            end
        end

        describe "年間実績" do
            it "個人年間実績が表示されているか" do
                expect(page).to have_selector ".year", text: 300000
            end

            it "個人年間目標が表示されているか" do
                expect(page).to have_selector ".year", text: 12000000
            end

            it "個人年間不足が表示されているか" do
                expect(page).to have_selector ".year", text: -11700000
            end

            it "個人年間達成率が反映されるか" do
                expect(page).to have_selector ".year", text: "2.5%"
            end

            it "全体年間実績が表示されているか" do
                expect(page).to have_selector ".year", text: 700000
            end

            it "全体年間目標が表示されているか" do
                expect(page).to have_selector ".year", text: 372000000
            end

            it "個人年間不足が表示されているか" do
                expect(page).to have_selector ".year", text: -371300000
            end

            it "個人年間達成率が反映されるか" do
                expect(page).to have_selector ".year", text: "0.18%"
            end
        end
    end

end