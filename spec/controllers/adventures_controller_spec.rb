require 'spec_helper'

describe AdventuresController do
  before(:each) do 
    @adv = Adventure.create(:title => "The beginning", :author => "John", :guid => SecureRandom.urlsafe_base64(10) )
    @page = @adv.pages.create(:name => "start", :text => "blahblahblah")
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
      get :create, { :adventure => { :title => "New title", :author => "John", :pages_attributes => [ :name => "start", :text => "yadayada" ] } }
      response.should be_redirect
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get :show, { :id => @adv.id }
      response.should be_redirect
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get :edit, {:id => @adv.id}
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get :update, :id => @adv.id, :adventure => { :title => "New title" }
      response.should be_redirect
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get :destroy, {:id => @adv.id}
      response.should be_redirect
    end
  end

end
