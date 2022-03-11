require 'rails_helper'

RSpec.describe Event, type: :model do 

  let!(:event) { FactoryBot.create(:event) }
  
  describe 'validation' do
    it 'eventが有効になる' do
      expect(event).to be_valid
    end

    it 'user_idが空で無効' do
      event.user_id = nil
      expect(event).to be_invalid
    end

    it 'customer_idが空で無効' do
      event.customer_id = nil
      expect(event).to be_invalid
    end
  end


end
