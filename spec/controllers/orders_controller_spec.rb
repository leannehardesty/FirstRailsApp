



require 'rails_helper'

describe OrdersController, :type => :controller do
  context "GET list of orders with products" do

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
  
  context "PUT #update" do
  end  

   
  context "GET #Show" do
      before do               
        @product = FactoryGirl.create(:product)
        @order = FactoryGirl.create(:order)
            
        get :show, id: @order
      end

      it "renders the order template" do
          expect(response).to render_template(:show)
      end
  end


  context "POST 'create'" do
    before do
      @product = FactoryGirl.build(:product)
      @product.save
      @order_attributes = FactoryGirl.attributes_for(:order, :product_id => @product)
    end

    it "creates a new order" do
      post :create, :product_id => @product.id.to_s, :order => @order_attributes
    end
  end


  context "DELETE #destroy" do
        before(:each) do
          @product = FactoryGirl.build(:product)
          @order = FactoryGirl.build(:order)
          @order.save
        end

      it "should delete the order" do
          @product.orders << @order
          delete :destroy, id: @order.id

      end  
    end
end


 















 