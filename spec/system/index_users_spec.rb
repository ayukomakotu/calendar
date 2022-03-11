require 'rails_helper'

RSpec.describe "IndexUsers", type: :system do

  before do
    100.times do |n|
      FactoryBot.create(:sample)
    end
  end

  context "GET /users/index" do
    let(:archer){FactoryBot.create(:archer)}
    pending "ページネーションが機能しているか" do
      
      visit users_path
      find_link("/users/index?page=4").click
      expect(page).to have_content User.last.name
    end

   
  end
end
