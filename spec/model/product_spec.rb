

require 'rails_helper'

describe Product do


	before do
	  @product = Product.create!(name: "race bike")
	  @user = User.create(email: "lhardesty11@gmail.com", password: "lobster")
	  @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
	  @product.comments.create!(rating: 3, user: @user, body: "Ok bike!")
	  @product.comments.create!(rating: 5, user: @user, body: "Superb bike!")
	end


	it "should return the average rating of all comments for that user" do
      expect(@product.average_rating).to eq 3
    end

    it "should invalidate an entry without a product name" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end


end