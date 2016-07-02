

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do


	
	  context "GET #ApplicationController" do
	    before do
	      
	    end

	    it "responds successfully with an HTTP 200 status code" do
	      expect(response).to be_success
	      expect(response).to have_http_status(200)
	    end

		

	  end

	     



end