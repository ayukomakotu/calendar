require 'rails_helper'

RSpec.describe "Events", type: :request do

  let!(:sample_office)  { FactoryBot.create(:sample_office) }
  let!(:user1)          { FactoryBot.create(:user1, office_id: sample_office.id) }
  let!(:item)           { FactoryBot.create(:item) }
  let!(:route)          { FactoryBot.create(:route)}
  
  describe "GET /index" do
    it "リクエストが成功するか" do
      log_in_as(user1)
      get events_path
      expect(response.status).to eq 200
    end
  end

  describe "GET /new" do
    it "リクエストが成功するか" do
      log_in_as(user1)
      get new_event_path
      expect(response.status).to eq 200
    end
  end

  describe "POST /create" do
    describe "パラメータが有効な場合" do
      it "リクエストが成功し、eventが増えるか" do
        log_in_as(user1)
        expect do
          post events_path, params: { event_form: { last_name: "sample_last",
                                                    first_name: "sample_first",
                                                    address: "sample_address",
                                                    telephone: "telephone",
                                                    start_time: Date.today,
                                                    car: 1,
                                                    start: Time.now,
                                                    finish: Time.now,
                                                    user_id: user1.id,
                                                    item_id: item.id,
                                                    number: 100,
                                                    price: 260000,
                                                    route_id: route.id }}
          expect(response.status).to eq 302
          expect(response).to redirect_to events_path
        end.to change { Event.count }.by(1).and change { Customer.count }.by(1).and change { Order.count }.by(1)
      end
    end

    describe "パラメータが不正な場合" do
      it "リクエストが失敗するか" do
        log_in_as(user1)
        expect do
          post events_path, params: { event_form: { last_name: "   ",
                                                    first_name: "   ",
                                                    address: "   ",
                                                    telephone: "   ",
                                                    start_time: Date.today,
                                                    car: 1,
                                                    start: Time.now,
                                                    finish: Time.now,
                                                    user_id: user1.id,
                                                    item_id: item.id,
                                                    number: 100,
                                                    price: 260000,
                                                    route_id: route.id }}
          expect(response.status).to eq 200
          expect(response.body).to include "error"
        end.to change { Event.count }.by(0).and change { Customer.count }.by(0).and change { Order.count }.by(0)
      end
    end

    it "非ログイン状態でログイン画面に戻される" do
      post events_path, params: { event_form: { last_name: "sample_last",
                                                    first_name: "sample_first",
                                                    address: "sample_address",
                                                    telephone: "telephone",
                                                    start_time: Date.today,
                                                    car: 1,
                                                    start: Time.now,
                                                    finish: Time.now,
                                                    user_id: user1.id,
                                                    item_id: item.id,
                                                    number: 100,
                                                    price: 260000,
                                                    route_id: route.id }}
      expect(response).to redirect_to(login_path)
    end
  end

end
