# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

library = Library.create!(url: "/adventures")
adv = Adventure.create!(:title => "Kill Me",
	:author => "Ashley", :guid => "#{SecureRandom.urlsafe_base64(10)}")
adv.pages.create!(:name => "start",
	:text => "This is torture!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow I'm so glad this is over!")