require 'rails_helper'

RSpec.describe "Appoints", type: :request do

  let!(:user1)    { FactoryBot.create(:user1) }
  let!(:appoint1) { FactoryBot.create(:appoint1, user_id: user1.id)} 

  describe "GET /index" do
    it "リクエストが成功するか" do
      log_in_as(user1)
      get appoints_path
      expect(response.status).to eq 200
    end
  end

  describe "GET /new" do
    it "リクエストが成功するか" do
      log_in_as(user1)
      get new_appoint_path
      expect(response.status).to eq 200
    end
  end
  describe "POST /create" do
    it "リクエストが成功するか" do
      log_in_as(user1)
      expect do
        post appoints_path, params: {appoint: {name: "test_example",
                                              address: "test_example",
                                              telephone: "xxx-xxxx-xxxx",
                                              day: Date.today,
                                              time: Time.now, 
                                              kind: "test_example",
                                              user_id: user1.id}}
        expect(response.status).to eq 302
      end.to change { Appoint.all.count }.by(1)
    end
  end
  describe "GET /id/edit" do
    it "リクエストが成功するか" do
      log_in_as(user1)
      get edit_appoint_path(appoint1)
      expect(response.status).to eq 200
    end
  end
  describe "PATCH /update" do
    it "リクエストが成功するか" do
      log_in_as(user1)
      patch appoint_path(user1), params: {appoint: {name: "update_example",
                                          address: "test_example",
                                          telephone: "xxx-xxxx-xxxx",
                                          day: Date.today,
                                          time: Time.now, 
                                          kind: "test_example",
                                          user_id: user1.id}}
      expect(response.status).to eq 302
      expect(appoint1.reload.name).to eq "update_example"
    end
  end

  describe "GET / get_result" do
    it "リクエストが成功するか" do
      log_in_as(user1)
      get edit_result_appoint_path(appoint1)
      expect(response.status).to eq 200
    end
  end
end
