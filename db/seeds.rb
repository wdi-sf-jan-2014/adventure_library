# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


adv = Adventure.create!(:title => "Isa's Excellent Test Adventure",
	:author => "Isa", :guid => "N8JqJGhVxX3Udw")
adv.pages.create!(:name => "start",
	:text => "The phone was ringing in the telephone booth as I walked by.  I am looking into a spiraling light, I think I [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Yep, I'm somewhere else.  Nope, I'm not somwhere else, I am someWHEN else!")


adv2 = Adventure.create!(:title => "An Ode To Summer",
	:author => "Isa", :guid => "CVQ8KxmOmBsPeg")
adv2.pages.create!(:name => "start",
	:text => "The phone was ringing in the telephone booth as I walked by.  I am looking into a spiraling light, I think I [[see the end|end]]")
adv2.pages.create!(:name => "end",
	:text => "Yep, I'm somewhere else.  Nope, I'm not somwhere else, I am someWHEN else!")

#lib = Library.create!(:url => "http://adventures-with-raphael.herokuapp.com/")