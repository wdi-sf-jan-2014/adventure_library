require 'spec_helper'

describe LibrariesController do
  
  before(:each) do 
    @lib = Library.create(:url => "http://adventures-with-raphael.herokuapp.com/", )
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new 
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get :create, :library => { :url => "http://polar-taiga-5141.herokuapp.com/" }
      response.should be_redirect
    end
  end

end
