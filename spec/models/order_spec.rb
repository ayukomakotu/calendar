require 'rails_helper'

RSpec.describe Order, type: :model do

  let!(:order) { FactoryBot.create(:order)}

  describe "validation" do
    it "orderが有効になる" do
      expect(order).to be_valid
    end

    it "route_idが空で無効になる" do
      order.route_id = nil
      expect(order).to be_invalid
    end

    it "item_idが空で無効になる" do
      order.item_id = nil
      expect(order).to be_invalid
    end
  end
end
