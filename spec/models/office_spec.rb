require 'rails_helper'

RSpec.describe Office, type: :model do
  let!(:sample_office)   { FactoryBot.build(:sample_office)}

  it "officeが有効になるか" do
    expect(sample_office).to be_valid
  end

  it "nameが空で無効になるか" do
    sample_office.name = "   "
    expect(sample_office).to be_valid
  end
end
