stypi.md

GENERATE MODELS
-------------------------------------------------------------------------
rails g model adventure title author guid library:belongs_to
rails g model page adventure:belongs_to name text:text
rails g model library url
--------------------------------------------------------------------------

MIGRATION FILES
-----------------------------------------------------------------------------
class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :title
      t.string :author
      t.string :guid
        t.belongs_to :library, index: true
        
      t.timestamps
    end
  end
end

class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :text
        t.belongs_to :adventure, index: true
      t.timestamps
    end
  end
end

class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :url

      t.timestamps
    end
  end
end
-----------------------------------------------------------------------------------------------------

SCHEMA CODE
---------------------------------------------------------------------------------------------------
ActiveRecord::Schema.define(version: 20140215002019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventures", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "guid"
    t.integer  "library_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adventures", ["library_id"], name: "index_adventures_on_library_id", using: :btree

  create_table "libraries", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "adventure_id"
    t.string   "name"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["adventure_id"], name: "index_pages_on_adventure_id", using: :btree

end
----------------------------------------------------------------------------------------------------------

MODEL CODE
-----------------------------------------------------------------------

class Library < ActiveRecord::Base
  has_many :adventures, dependent: :destroy
end

class Adventure < ActiveRecord::Base
  belongs_to :library
  has_many :pages, dependent: :destroy
  
  before_save {|adv| adv.guid = create_guid }

  private 

  def create_guid
    SecureRandom.urlsafe_base64(10)
  end

  
end

class Page < ActiveRecord::Base
  belongs_to :adventure
end

--------------------------------------------------------------------------

David's seed.rb

adv = Adventure.create!(:title => "David's Test Adventure",
  :author => "David")
adv.pages.create!(:name => "start",
  :text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
  :text => "Wow that adventure was amazing!")
-------------------------------------------------------------------------------


GENERATE CONTROLLER 
-------------------------------------------------
rails g controller libraries index --no-test-framework
rails g controller adventures show edit new --no-test-framework
rails g controller pages show edit new --no-test-framework