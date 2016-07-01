

require 'rails_helper'

describe UsersController, :type => :controller do
	  	context "GET #index" do
		    before do
		      @user = FactoryGirl.create(:user)
		      sign_in @user
		      get :index
		    end

			it "responds successfully with an HTTP 200 status code" do
		      expect(response).to be_success
		      expect(response).to have_http_status(200)
		    end

		    it "renders the index template" do
		      expect(response).to render_template("index")
		    end
	  	end


   describe "GET #show" do
  		include Devise::TestHelpers
  		include ControllerHelpers

     	context "User is logged in" do
     		before do
    			@user = FactoryGirl.create(:user)
    			@user2 = FactoryGirl.create(:user)
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
				expect(assigns(:user)).not_to eq @user
				expect(response).to have_http_status(200)
			end			
		end

		context "No user is logged in" do
			before do
				#stub out authentication in Devise
     			allow(request.env['warden'])
    			.to receive(:authenticate!)
    			.and_throw(:warden, {:scope => :user})
    			#@user = nil
     		end
			  
			
			it "responds successfully with an HTTP 200 status code on landing page" do
	      		expect(response).to be_success
	      		expect(response).to have_http_status(200)
	    	end			
			 
		end
	end 


    describe "POST 'create'" do
	    before(:each) do   
	      @user_attributes = FactoryGirl.attributes_for(:user)
	    end
	    it "should create a new user" do
	      post :create, :user => @user_attributes
	    end
  	end
		






end


