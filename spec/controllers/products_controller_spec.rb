


require 'rails_helper'

describe ProductsController, :type => :controller do

    describe "GET #index" do
	    before do
	      get :index
	    end

	    it "responds successfully with an HTTP 200 status code" do
	      expect(response).to be_success
	      expect(response).to have_http_status(200)
	    end

	    it "renders the index view" do
	      expect(response).to render_template("index")
	    end
    end


	describe "GET #Show" do
  		before do
          @product = FactoryGirl.build(:product)
          @product.save         
  		    get :show, id: @product   			 
  		end

      it "renders the product template" do
	        expect(response).to render_template("show")
	    end

	    it "assigns the requested product to @product" do
	    	product = FactoryGirl.create(:product)
	    	get :show, id: product
	    	expect(assigns(:product)).to eq(product)
	    end

		it "renders the #show view" do
	    	product = FactoryGirl.create(:product)
	    	get :show, id: product
	    	expect(response).to render_template(:show)
	    end
  	end



    describe "GET #New" do
  		before do
          @product = FactoryGirl.build(:product)
      		@product.save
      		@product_attributes = FactoryGirl.attributes_for(:product, :id => @product)
  		end

  		it "new product" do
    		product_params = FactoryGirl.attributes_for(:product) 
      		get :new, :product => product_params, :id => @product.id.to_s
      		expect(response).to render_template(:new)
    	end

  	end


	describe "GET #Edit" do
  		before do
          @product = FactoryGirl.build(:product)
      		@product.save
      		@product_attributes = FactoryGirl.attributes_for(:product, :id => @product)
  		end

  		it "edits the product" do
    		product_params = FactoryGirl.attributes_for(:product) 
      	get :edit, :product => product_params, :id => @product.id.to_s
    	end
  	end




	describe "POST create" do
		before do
			@product_params = FactoryGirl.attributes_for(:product)
		end

	  it "creates product" do 
	  		expect { post :create, :product => @product_params }.to change(Product, :count).by(1) 
		end 

		it "redirects to the new product" do 
	  		expect { post :create, :product => @product_params }.to change(Product, :count).by(1) 
	  		expect(response).to redirect_to(:root)
		end 

    it "renders new template" do
        product_params = FactoryGirl.attributes_for(:product) 
        @product = FactoryGirl.build(:product)
        get :new, :product => product_params, :id => @product.id.to_s
        expect(response).to render_template(:new)
    end
	end



	describe "PUT #update" do
  	  	before(:each) do
      		@product = FactoryGirl.build(:product)
      		@product.save
      		@product_attributes = FactoryGirl.attributes_for(:product, :id => @product)
          @prodparams = nil

    	end

    	it "updates the product successfully" do
          product_params = FactoryGirl.attributes_for(:product) 
          get :update, :product => product_params, :id => @product.id.to_s
          expect(response).to redirect_to @product
    	end


      it "does not update the product successfully" do
          
          #expect(response).to render_template(:edit)
      end


  	end



  	describe "DELETE #destroy" do
  	  	before(:each) do
      		@product = FactoryGirl.build(:product)
      		@product.save
      		@product_attributes = FactoryGirl.attributes_for(:product, :id => @product)
    	end

    	it "deletes the product" do
    		product_params = FactoryGirl.attributes_for(:product)
      		expect{ delete :destroy, :product => product_params, :id => @product.id.to_s }.to change(Product, :count).by(-1)
    	end

        it "can't delete if id is unknown" do
    		product_params = FactoryGirl.attributes_for(:product)
      		expect { delete :destroy, { id: 'unknown' } }.to raise_error(ActiveRecord::RecordNotFound)   
    	end
  	end



  
end


































