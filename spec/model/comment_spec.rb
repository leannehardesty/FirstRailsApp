

require 'rails_helper'

describe Comment do


	before do
	   
	  @product = Product.create!(name: "race bike")
	  @user = FactoryGirl.create(:user)
	  @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
	   
	end


    it "should invalidate an entry without a comment" do
		expect(Comment.new(rating: 2)).not_to be_valid
	end

end