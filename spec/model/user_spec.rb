
require 'rails_helper'

RSpec.describe User, type: :model do


	before do
		@user = FactoryGirl.create(:user)

	end


	context "User created" do
		#before {@user = User.create(first_name: "Lee", last_name: "Bryon", email: "brian@example.com", password: "123123")}

		it "is a valid user" do
			expect(@user).to be_valid
		end

	end

	context "it should invalidate an entry without a first name" do
		#before {@user = User.new(first_name: nil, last_name: "Bryon", email: "brian@example.com", password: "123")}

		it "creates an error" do
			#expect(@user).to_not be_valid
			expect(User.new(last_name: "Nicely")).not_to be_valid
		end	
	end

	context "it should invalidate an entry without a last name" do
	
		it "creates an error" do
			#expect(@user).to_not be_valid
			expect(User.new(first_name: "Bryan")).not_to be_valid
		end	
	end

	context "it should invalidate an entry without an email" do
	
		it "creates an error" do
			#expect(@user).to_not be_valid
			expect(User.new(first_name: "Bryan", last_name: "Coco")).not_to be_valid
		end	
	end





end




 


