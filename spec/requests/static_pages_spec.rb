require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "レスポンスに成功" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /help" do
    it "レスポンスに成功" do
      get help_path
      expect(response).to have_http_status(:success)
    end
  end
end
