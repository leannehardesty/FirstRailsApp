

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
 
	  
	context "GET #new" do
	end

	context "GET #edit" do
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
    			 
     		end
			
			it "responds successfully with an HTTP 200 status code on landing page" do
	      		expect(response).to be_success
	      		expect(response).to have_http_status(200)
	    	end			
		end
	end 


    describe "POST 'create'" do
	    before do   
	      @user_attributes = FactoryGirl.attributes_for(:user)
	    end
	    it "should create a new user" do
	      post :create, :user => @user_attributes
	    end
  	end

  	 
	describe "PUT #Update" do
		before do
			@user = FactoryGirl.create(:user)
			@user.save
		    sign_in @user
      		@user_attributes = FactoryGirl.attributes_for(:user, :id => @user)
    	end
   		it "redirects to login if not Admin" do
   			user_params = FactoryGirl.attributes_for(:user)
      		patch :update, :user => user_params, :id => @user.id.to_s
      		expect(response).to redirect_to("http://test.host/")
    	end
  
   	end

 	describe "DELETE #destroy" do
  	  	before  do
      		@admin = FactoryGirl.create(:admin)
		    sign_in @admin
      		@admin_attributes = FactoryGirl.attributes_for(:admin, :id => @admin)
    	end

    	it "deletes the user" do
    		user_params = FactoryGirl.attributes_for(:admin)
      		expect{ delete :destroy, :admin => user_params, :id => @admin.id.to_s }.to change(User, :count).by(-1)
    	end

        it "can't delete if id is unknown" do
    		user_params = FactoryGirl.attributes_for(:admin)
      		expect { delete :destroy, { id: 'unknown' } }.to raise_error(ActiveRecord::RecordNotFound)   
    	end
  	end
end

  















  


















