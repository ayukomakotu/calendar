require 'rails_helper'

RSpec.describe "Users", type: :request do

  let!(:user1) { FactoryBot.create(:user1) }

  describe "GET /index" do
    it "responseが成功すること" do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "responseが成功すること" do
      get user_path(user1)
      expect(response).to have_http_status(:success)
    end
  end
end