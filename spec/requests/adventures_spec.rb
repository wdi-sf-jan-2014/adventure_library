require 'spec_helper'

describe 'New Adventure' do
  context 'create' do
    it 'should create a guid when none provided' do
      guid_adventure1 = Adventure.create!(:title => "test_guid", :author => "Guido the author")
      expect(guid_adventure1.guid).not_to be_nil
    end

    # probably a useless test, since really just testing rails create, but some practice anyway
    # actually, this may be some useful testing of the condition in the callback (before_create)
    it 'should store a provided guid when one provided' do
      a_guid = SecureRandom.urlsafe_base64(10)
      guid_adventure2 = Adventure.create!(:title => "test_guid 2",
                                            :author => "Guido the author",
                                            :guid => a_guid)
      expect(guid_adventure2.guid).to equal(a_guid)
    end
  end

  context 'save' do
    it 'should create a guid when none provided' do
      guid_adventure3 = Adventure.new
      guid_adventure3.title = "Let's test a guid"
      guid_adventure3.author = "An Author"
      guid_adventure3.save
      expect(guid_adventure3.guid).not_to be_nil
    end

    # probably a useless test, since really just testing rails save, but some practice anyway
    # actually, this may be some useful testing of the condition in the callback (before_create)
    it 'should store a provided guid when one provided' do
      guid_adventure4 = Adventure.new
      guid_adventure4.title = "Let's test a guid"
      guid_adventure4.author = "An Author"
      a_guid = SecureRandom.urlsafe_base64(10)
      guid_adventure4.guid = a_guid
      guid_adventure4.save
      expect(guid_adventure4.guid).to equal(a_guid)
    end
  end
end
  
describe '/adventures' do
  before(:each) do 
    @local_adventure = Adventure.create!(:title => "test",
                                        :author => "Test author")
    @local_adventure.pages.create!(:name => "start", :text => "cool story bro")

    @foreign_adventure = Adventure.create!(:title => "Ceci n'est pas un test.",
                                    :author => "Foreign author",
                                    :library_id => 4)
    @foreign_adventure.pages.create(:name => "start", :text => "Chouette histoire, mec.")

  end

	describe 'GET with JSON' do
    before(:each) do 
      get '/adventures.json'
      @result = JSON.parse(response.body)
    end
    it 'returns a list of all the adventures made locally' do
      
      @result["adventures"].should_not == nil
      @result["adventures"].length.should == 1
      @result["adventures"].first["title"].should == @local_adventure["title"]
    end

    it 'gets back the pages of a returned adventure' do 
      pages = @result["adventures"].first["pages"]
      pages.should_not == nil
      pages.length.should == @local_adventure.pages.length
      p = pages.first
      p_in_db = @local_adventure.pages.first
      p["name"].should == p_in_db.name
      p["text"].should == p_in_db.text
    end

    it 'does not return adventures made on another server' do 
      @result["adventures"].detect{|a| a["title"] == @foreign_adventure.title
        }.should == nil
    end
  end

  # describe 'GET with HTML' do
  #   before do
  #     get '/adventures'
  #   end
  #   it 'returns all adventures'
  #   it 'returns adventures made on another server'    
  # end

  # describe 'POST' do
  #   it 'adds a locally made adventure'
  # end
end

describe '/libraries' do
  before do
    @library = Library.create!(:url => "example.com")
  end
    describe 'GET with JSON' do
      it 'returns a list of known libraries' do
           get '/libraries.json'
           result = JSON.parse(response.body)
           result["libraries"].first["url"].should == @library.url
      end
    end
end