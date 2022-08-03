require 'rails_helper'

RSpec.describe Customer, type: :model do
  let!(:customer) { FactoryBot.build(:customer)}
  context "バリデーション" do
    it "customerが有効になる" do
      expect(customer).to be_valid
    end 

    it "last_nameが空で無効" do
      customer.last_name = "  "
      expect(customer).to be_invalid
    end

    it "first_nameが空で無効" do
      customer.first_name = "  "
      expect(customer).to be_invalid
    end

    it "addressが空で無効" do
      customer.address = "  "
      expect(customer).to be_invalid
    end

    it "telephoneが空で無効" do
      customer.telephone = "  "
      expect(customer).to be_invalid
    end
  end


end
