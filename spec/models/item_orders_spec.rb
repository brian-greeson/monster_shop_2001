require 'rails_helper'

describe ItemOrder, type: :model do
  describe "validations" do
    it { should validate_presence_of :order_id }
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :price }
    it { should validate_presence_of :quantity }
  end

  describe "relationships" do
    it {should belong_to :item}
    it {should belong_to :order}
  end

  describe 'instance methods' do
    before(:each) do
      @user = User.create!(email_address: 'user1@example.com', password: 'password', role: 'default', name: 'User 1', street_address: '123 Example St', city: 'Userville', state: 'State 1', zip_code: '12345')
      @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
      @order_1 = @user.orders.create!(name: 'Meg', address: '123 Stang Ave', city: 'Hershey', state: 'PA', zip: 17033)
      @item_order_1 = @order_1.item_orders.create!(item: @tire, price: @tire.price, quantity: 2)
      
    end
    it 'subtotal' do
      expect(@item_order_1.subtotal).to eq(200)
    end

    it 'fulfill' do
      @item_order_1.fulfill
      
      expect(@item_order_1.status).to eq("fulfilled")
      expect(@tire.inventory).to eq(10)
    end

    it 'fulfilled?' do
      item_order_2 = @order_1.item_orders.create!(item: @tire, price: @tire.price, quantity: 1)
      
      expect(item_order_2.fulfilled?).to eq(false)
      item_order_2.update(status: "fulfilled")
      expect(item_order_2.fulfilled?).to eq(true)
    end

    it 'unfulfill' do
      item_order_2 = @order_1.item_orders.create!(item: @tire, price: @tire.price, quantity: 1, status: "fulfilled")

      item_order_2.unfulfill
      
      expect(item_order_2.status).to eq("unfulfilled")
      expect(@tire.inventory).to eq(13)
    end

    it 'unfulfilled?' do
      item_order_2 = @order_1.item_orders.create!(item: @tire, price: @tire.price, quantity: 1)

      expect(item_order_2.unfulfilled?).to eq(true)
      item_order_2.update(status: "fulfilled")
      expect(item_order_2.unfulfilled?).to eq(false)
    end

    after(:each) do
      ItemOrder.destroy_all
      Order.destroy_all
      User.destroy_all
      Merchant.destroy_all
    end
  end
end
