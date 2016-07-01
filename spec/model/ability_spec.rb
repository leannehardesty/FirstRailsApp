

require 'rails_helper'
 

 describe User do

	context "Admin user created" do

		before do
	  		@user = FactoryGirl.create(:user)
		end

		it "User created has admin set to nil" do
			expect(@user.admin).to eq(false)
		end

         

	end

end