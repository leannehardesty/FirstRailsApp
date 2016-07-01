


require 'rails_helper'

describe ProductsController, :type => :controller do

    context "GET #index" do
	    before do
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


	context "GET #Show" do
  		before do
  			get :products 
  		end

        it "renders the product template" do
	        expect(response).to render_template("products")
	    end



  	end



    context "GET #New" do
  		before do
            @product = FactoryGirl.build(:product)
      		@product.save
      		@product_attributes = FactoryGirl.attributes_for(:product, :id => @product)
  		end

  		it "new product" do
    		product_params = FactoryGirl.attributes_for(:product) 
      		get :new, :product => product_params, :id => @product.id.to_s
    	end

  	end

	context "GET #Edit" do
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




	context "POST create" do
	    it "creates product" do 
	  		product_params = FactoryGirl.attributes_for(:product)
	  		expect { post :create, :product => product_params }.to change(Product, :count).by(1) 
		end 
	end



	context "PUT #update" do
  	  	before(:each) do
      		@product = FactoryGirl.build(:product)
      		@product.save
      		@product_attributes = FactoryGirl.attributes_for(:product, :id => @product)
    	end

    	it "updates the product" do
    		product_params = FactoryGirl.attributes_for(:product)
      		
      		# this line works:  expect{ delete :destroy, :product => product_params, :id => @product.id.to_s }.to change(Product, :count).by(-1)

      		patch :edit, :product => product_params, :id => @product.id.to_s
             
    	end
  	end



  	context "DELETE #destroy" do
  	  	before(:each) do
      		@product = FactoryGirl.build(:product)
      		@product.save
      		@product_attributes = FactoryGirl.attributes_for(:product, :id => @product)
    	end

    	it "deletes the product" do
    		product_params = FactoryGirl.attributes_for(:product)
      		
      		expect{ delete :destroy, :product => product_params, :id => @product.id.to_s }.to change(Product, :count).by(-1)

      		# this line works too:  delete :destroy, :product => product_params, :id => @product.id.to_s
             
    	end

        it "can't delete if id is unknown" do
    		product_params = FactoryGirl.attributes_for(:product)
      		
      		#expect{ delete :destroy, :product => product_params, :id => @product.id.to_s }.to change(Product, :count).by(-1)

      		expect { delete :destroy, { id: 'unknown' } }.to raise_error(ActiveRecord::RecordNotFound)
             
    	end
  	end



  	context "set product" do
  		before do
  		 
  		end

  		it "id cannot be nil" do

  		end
  	end

	context "test product params" do
  		before do
  		 
  		end

  		it "required params are present" do

  		end
  	end


 
 

end

















