

require 'rails_helper'
 

 describe User do

	context "Regular user created" do

		before do
	  		@user = FactoryGirl.create(:user)
		end

		it "User created has admin set to nil" do
			expect(@user.admin).to eq(false)
		end
	end

	context "Admin user created" do

		before do
	  		@user = FactoryGirl.create(:admin)
		end

		it "User created is an admin" do
			expect(@user.admin).to eq(true)
		end
	end

end

 