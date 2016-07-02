require 'rails_helper'

describe StaticPagesController, :type => :controller do
  context "GET #landing_page" do
    before do
      get :landing_page
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("landing_page")
    end
  end


  context "GET #thank you" do
    before do
      @name = "LuLu"
      @email = "LuLu@LL.com"
      @message = "Hello"
      get :thank_you
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("thank_you")
    end
  end





end