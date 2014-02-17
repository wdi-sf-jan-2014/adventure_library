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
	:text => "Oh, Summer Oh, Summer you are so bright with your bright sunny days and hot August [[nights.|two]]")
adv2.pages.create!(:name => "two",
	:text => "Across the word it's you who we celebrate.  From Alaska to Nebraska we eagerly [[wait.|three]]")
adv2.pages.create!(:name => "three",
	:text => "Your return & arrival; in the cold we'll survive through.  You put love in the air, the thorugh of you staves off this wintry despair.  Dear Summer, are you [[there?|four]]")
adv2.pages.create!(:name => "four",
	:text => "Thanks to the earth's axis, mother nature's best practice.  We tilt up to your glare, your bright, come-hither stare. Dear Summer, are you [[there?.|end]]")
adv2.pages.create!(:name => "end",
	:text => "We love teeny bikinis and big sunnies, water sports and short shorts.  Summer, oh Summer meet us at the shore!  ")

#lib = Library.create!(:url => "http://adventures-with-raphael.herokuapp.com/")