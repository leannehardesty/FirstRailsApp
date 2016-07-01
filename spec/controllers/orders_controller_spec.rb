



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



  describe "POST 'create'" do

    before(:each) do
      @product = FactoryGirl.build(:product)
      @product.save
      @order_attributes = FactoryGirl.attributes_for(:order, :product_id => @product)
    end

    it "should create a new comment" do
      post :create, :product_id => @product.id.to_s, :order => @order_attributes
    end

  end



  context "DELETE #destroy" do
        before(:each) do
          @product = FactoryGirl.build(:product)
          #@product.save
          @order = FactoryGirl.build(:order)
          @order.save

        end

      it "should delete the order" do
          @product.orders << @order
          delete :destroy, id: @order.id

          #expect{ delete :destroy, id: @order.id}.to change{@orders.count}.by(-1)
          #expect{ delete :destroy, :product => product_params, :id => @product.id.to_s }.to change(Product, :count).by(-1)
      end  
    end

end


 















 