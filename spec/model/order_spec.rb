


require 'rails_helper'

describe Order do

	before do

	  @product = Product.create!(name: "race bike")
	  #@user = User.create!(email: "lhardesty11@gmail.com", password: "lobster")
	  @user = FactoryGirl.create(:user)
	  @product.orders.create!(user: @user, product: @product)
	  
	end


    it "should validate an entry with a positive total" do
		expect(Order.new(total: 200.00)).to be_valid 
	end
 
end



    