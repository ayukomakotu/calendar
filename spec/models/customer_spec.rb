require 'rails_helper'

RSpec.describe Customer, type: :model do
  let!(:customer) { FactoryBot.build(:customer)}
  it "customerが有効になる" do
    expect(customer).to be_valid
  end 
end
