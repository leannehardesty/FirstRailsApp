
require 'rails_helper'

describe UsersController, :type => :controller do

    before do
    	@user = User.create!(email: "lhardesty11@gmail.com", password: "lobster")
    	@user2 = User.create!(email: "brian@gmail.com", password: "lobster")
    	
  	end

  	describe "GET #show" do
     	context "User is logged in" do
     		before do
     			sign_in @user
     		end

	
			it "loads correct user details" do
				get :show, id: @user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end

			it "first user can't access show page of second user" do
				get :show, id: @user2.id
				#expect(:id).not_to eq @user2
				expect(assigns(:user)).not_to eq @user2
				expect(response).to redirect_to(root_path)
			end
 
		

			it "user tries to access another user's show page and it responds with an HTTP 401 unauthorized status code" do
      			get :show, id: @user2.id
      			expect(assigns(:user)).not_to eq @user
      			expect(response).to have_http_status(401)
    		end


		end

		context "No user is logged in" do
			it "redirects to login" do
				get :show, id: @user.id
				#expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)

				
			end
		end
	 end
	 
end


  
 
