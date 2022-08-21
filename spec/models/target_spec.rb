require 'rails_helper'

RSpec.describe Target, type: :model do
  let!(:sample_office)  { FactoryBot.create(:sample_office) }
  let!(:user1)          { FactoryBot.create(:user1, office_id: sample_office.id) }
  let!(:sample_target)  { FactoryBot.build(:sample_target)}

  it "targetが有効になるか" do
    expect(sample_target).to be_valid
  end
end
