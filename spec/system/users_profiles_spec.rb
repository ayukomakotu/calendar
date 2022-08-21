require 'rails_helper'

RSpec.describe "UsersProfiles", type: :system do
  
  let!(:sample_office)  { FactoryBot.create(:sample_office) }
  let!(:user1)          { FactoryBot.create(:user1, office_id: sample_office.id) }

  it "タイトルは正しいか" do
    visit user_path(user1)
    expect(page).to have_title user1.name
  end
  it "正しいユーザーの情報が表示されているか" do
    visit user_path(user1)
    expect(page).to have_content user1.name
  end
end
