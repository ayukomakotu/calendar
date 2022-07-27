require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:item) { FactoryBot.create(:item) }

  describe "validation" do
    it "itemが有効になる" do
      expect(item).to be_valid
    end

    it "nameが空で無効" do
      item.name = "  "
      expect(item).to be_invalid
    end

    it "unitが空で無効" do
      item.unit = "   "
      expect(item).to be_invalid
    end

    it "priceが空で無効" do
      item.price = nil
      expect(item).to be_invalid
    end

    it "nameがunique" do
      @other_item = Item.create(name: "test_item",
                               unit: "単価2",
                               price: 10 )
      expect(@other_item).to be_invalid
    end
  end 
end
