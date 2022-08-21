require 'rails_helper'

RSpec.describe "IndexUsers", type: :system do

  let!(:sample_office)  { FactoryBot.create(:sample_office) }
  let!(:user1)          { FactoryBot.create(:user1, office_id: sample_office.id) }
  let!(:sample_user)  { FactoryBot.create_list(:sample_user, 30, office_id: sample_office.id) }

  it "ページネーションが機能しているか" do
    log_in_system(user1)
    visit users_path
    find("a", text: "Next").click
    expect(page).to have_content User.last.name
  end
end
