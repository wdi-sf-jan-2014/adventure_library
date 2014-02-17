require 'spec_helper'

describe PagesController do
  
  before(:each) do
    @adv = Adventure.create( :title => "The Lorax", :author => "Dr. Seuss", :guid => SecureRandom.urlsafe_base64(10) )
    @page = @adv.pages.create( :name => "start", :text => "I am the Lorax, I speak for the trees!")
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new, :adventure_id => @adv.id
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get :create, :adventure_id => @adv.id, :page => {:name => "end", :text=> "The end"}
      response.should be_redirect
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get :show, :adventure_id => @adv.id, :id => @page.id
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get :edit, :adventure_id => @adv.id, :id => @page.id
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get :update, :adventure_id => @adv.id, :id => @page.id, :page => { :name => "end", :text=> "The end" }
      response.should be_redirect
    end
  end

  describe "GET 'delete'" do
    it "returns http success" do
      get :destroy, :adventure_id => @adv.id, :id => @page.id
      response.should be_redirect
    end
  end

end
