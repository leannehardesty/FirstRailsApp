
require 'rails_helper'

RSpec.describe User, type: :model do


	before do
		@user = FactoryGirl.create(:user)

	end
 

	context "User created"  do

		it "has a valid factory" do
			expect(FactoryGirl.create(:user)).to be_valid
 		end

		it "is a valid user" do
			expect(@user).to be_valid
		end
	end


	context "User is invalid due to:" do

		it "missing first name" do
 			expect(User.new(last_name: "Nicely")).not_to be_valid
		end	
  
		it "missing last name" do
 			expect(User.new(first_name: "JoJo")).not_to be_valid
		end
 
 	end

	context "User is invalid due to:" do
 		it "missing email" do
			expect(User.new(last_name: "Nicely", first_name: "Johnny")).not_to be_valid
 		end	
  	end
  
end




 


