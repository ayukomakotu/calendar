require 'rails_helper'

RSpec.describe Route, type: :model do
  
  let!(:route) { FactoryBot.create(:route) }

  describe "validation" do
    it "routeが有効になる" do
      expect(route).to be_valid
    end

    it "nameが空で無効になる" do
      route.name = nil
      expect(route).to be_invalid
    end

    it "nameがuniqueになっている" do
      @other_route = Route.new(name: "取扱経路")
      expect(@other_route).to be_invalid
    end

    
  end
end
