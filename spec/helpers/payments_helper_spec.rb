require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PaymentsHelper. For example:
#
# describe PaymentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PaymentsHelper, type: :helper do


  context "Total is positive number" do
	before do
		#@user = User.create!(email: "lhardesty11@gmail.com", password: "lobster")
    @user = FactoryGirl.create(:user)
		@product = Product.create!(name: "Red bike")
		@orders = Order.create!(total: 100.00, product_id: @product, user_id: @user)
	end

  	it "Valid (positive) total" do
  		expect(@orders).to be_valid
  		#expect(Order.new(id: nil, user_id: nil, product_id: nil, total: 0.0)).not_to be_valid
  	end
  end
end



  