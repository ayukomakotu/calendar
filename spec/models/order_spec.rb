require 'rails_helper'

RSpec.describe Order, type: :model do

  let!(:user1) { FactoryBot.create(:user1)}
  let!(:item) { FactoryBot.create(:item)}
  let!(:customer) { FactoryBot.create(:customer)}
  let!(:route) { FactoryBot.create(:route)}
  let!(:event) { FactoryBot.create(:event, user_id: user1.id, customer_id: customer.id)}
  let!(:order) { FactoryBot.build(:order, user: user1, item: item, route: route, event: event)}

  describe "validation" do
    it "orderが有効になる" do
      expect(order).to be_valid
    end


    it "numberが空で無効" do
      order.number = nil
      expect(order).to be_invalid
    end
    
    it "priceが空で無効" do
      order.price = nil
      expect(order).to be_invalid
    end

    it "dayが空で無効" do
      order.day = "  "
      expect(order).to be_invalid
    end
    
    it "route_idが空で無効になる" do
      order.route_id = nil
      expect(order).to be_invalid
    end

    it "item_idが空で無効になる" do
      order.item_id = nil
      expect(order).to be_invalid
    end

    it "user_idが空で無効になる" do
      order.user_id = nil
      expect(order).to be_invalid
    end

    it "event_idが空で無効になる" do
      order.event_id = nil
      expect(order).to be_invalid
    end
  end
end
