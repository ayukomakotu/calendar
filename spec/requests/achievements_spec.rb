require 'rails_helper'

RSpec.describe "Achievements", type: :request do

  let!(:sample_office)  { FactoryBot.create(:sample_office) }
  let!(:user1)          { FactoryBot.create(:user1, office_id: sample_office.id) }
  let!(:sample_target)  { FactoryBot.create(:sample_target, office_id: sample_office.id)}
  let!(:sample_target2) { FactoryBot.create(:sample_target2, user_id: user1.id)}

  describe "GET /achievements" do
    it "リクエストが成功するか" do
      log_in_as(user1)
      get achievements_path
      expect(response.status).to eq 200
    end
  end
end
