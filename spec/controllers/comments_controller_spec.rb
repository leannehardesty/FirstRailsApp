

require 'rails_helper'

describe CommentsController, :type => :controller do

  context "GET #index" do
  end

  context "GET #show" do
  end
 
  context "GET #new" do
  end

  context "GET #edit" do
  end
  
  context "PUT #update" do
  end  

  context "GET product list with comments" do
    before do
    	@products = Product.all
    	redirect_to @product
    	@user = FactoryGirl.create(:user)
      @admin = FactoryGirl.create(:admin)
     	sign_in @user
     end


    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  
  describe "POST 'create'" do

    before do
      @product = FactoryGirl.build(:product)
      @product.save
      @comment_attributes = FactoryGirl.attributes_for(:comment, :product_id => @product)
      @comments = @product.comments
    end

    context "with valid attributes" do
      it "creates a new comment" do
          post :create, :product_id => @product.id.to_s, :comment => @comment_attributes 
    
      end

      it "redirects to that product and comment" do
        post :create, :product_id => @product.id.to_s, :comment => @comment_attributes 
        expect(response).to redirect_to Product.last
      end
    end

  end



    context "DELETE #destroy" do
        before do
          @product = FactoryGirl.build(:product)
          @product.save         
          @user = FactoryGirl.build(:user)
          @comment = @product.comments.create!(rating: 1, user: @user, body: "Boca bike!")
           
        end

      it "deletes the comment" do
          expect{delete :destroy, id: @comment, product_id: @product}.to change{@product.comments.count}.by(-1)  
          
      end  
    end


    context "comment params" do

      it "all comment params available" do
        # test for params
        #params.require(:comment).permit(:user_id, :body, :rating)
      end
    end

    context "find params" do

      it "search params " do
        #@comment = Comment.find(params[:id])
        # test for params
      end
    end
 

end

     

 












