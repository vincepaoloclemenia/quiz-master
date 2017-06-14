require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

    before do
		  allow(controller).to receive(:authenticate_user!).and_return(true) 		
	  end

  describe "Get #index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template and redirects to home if signed in" do
      get :index
      expect(response).to render_template("index")
    end
  end

end