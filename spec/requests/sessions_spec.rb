require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  let!(:sample_office)  { FactoryBot.create(:sample_office) }
  let!(:user1)          { FactoryBot.create(:user1, office_id: sample_office.id) }

  describe "GET /new" do
    it "リクエストが成功するか" do
      get login_path
      expect(response.status).to eq 200
    end
  end

  describe "POST /login" do
    it "リクエストが成功するか" do
      post login_path, params: { session: { number: user1.number, password: user1.password }}
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE /loguot" do
    it "リクエストが成功するか, 正しくリダイレクトするか" do
      post login_path, params: { session: { number: user1.number, password: user1.password }}
      delete logout_path
      expect(response).to have_http_status(303)
      expect(response).to redirect_to login_path
    end

    it "二番目のウインドウでのログアウト" do
      post login_path, params: { session: { number: user1.number, password: user1.password }}
      delete logout_path
      expect(response).to have_http_status(303)
      delete logout_path
      expect(response).to have_http_status(303)
    end
  end

  # describe "remmeber me" do
  #   it "rememebr meあり" do
  #       post login_path, params: {session: { number: user1.number, 
  #                                            password: user1.password,
  #                                            remember_me: "1" }}
  #       expect(response.cookies['remember_token']).to_not eq nil
  #   end

  #   it "remember me なし" do
  #     post login_path, params: {session: { number: user1.number, 
  #                                            password: user1.password,
  #                                            remember_me: "1" }}
  #     delete logout_path
      
  #     post login_path, params: {session: { number: user1.number, 
  #                                            password: user1.password,
  #                                            remember_me: "0" }}
  #       expect(response.cookies['remember_token']).to eq nil
  #   end
  # end
end
