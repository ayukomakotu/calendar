require 'rails_helper'

RSpec.describe "IndexUsers", type: :system do

  let!(:user1) { FactoryBot.create(:user1) }
  let!(:sample_user)  { FactoryBot.create_list(:sample_user, 30) }

  it "ページネーションが機能しているか" do
    log_in_system(user1)
    visit users_path
    find("a", text: "Next").click
    expect(page).to have_content User.last.name
  end
end
