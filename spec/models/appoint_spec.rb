require 'rails_helper'

RSpec.describe Appoint, type: :model do
  let!(:sample_office)   { FactoryBot.create(:sample_office)}
  let!(:user1) { FactoryBot.create(:user1, office_id: sample_office.id)}
  before do
    @appoint = FactoryBot.build(:appoint1, user_id: user1.id)
  end

  context "バリデーション" do
    it "appointが有効になる" do
      expect(@appoint).to be_valid
    end

    it "nameが空で無効になる" do
      @appoint.name = "   "
      expect(@appoint).to be_invalid
    end

    it "addressが空で無効になる" do
      @appoint.address = "   "
      expect(@appoint).to be_invalid 
    end 

    it "telephoneが空で無効になる" do
      @appoint.telephone = "   "
      expect(@appoint).to be_invalid 
    end 

    it "dayが空で無効になる" do
      @appoint.day = "   "
      expect(@appoint).to be_invalid 
    end 

    it "timeが空で無効になる" do
      @appoint.time = "   "
      expect(@appoint).to be_invalid 
    end 

    it "kindが空で無効になる" do
      @appoint.kind = "   "
      expect(@appoint).to be_invalid 
    end 

    it "user_idが空で無効になる" do
      @appoint.user_id = nil
      expect(@appoint).to be_invalid
    end
  end
end
