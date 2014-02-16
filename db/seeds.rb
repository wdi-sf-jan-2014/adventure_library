# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adv = Adventure.create!(:title => "Rafi's Test Adventure",
	:author => "Rafi", :guid => "aCB-HtxDLT873Q")
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")


adv_2 = Adventure.create!(:title => "Isa's Excellent Test Adventure",
	:author => "Isa", :guid => "N8JqJGhVxX3Udw")
adv_2.pages.create!(:name => "start",
	:text => "The phone was ringing in the telephone booth as I walked by.  I am looking into a spiraling light, I think I [[see the end|end]]")
adv_2.pages.create!(:name => "end",
	:text => "Yep, I'm somewhere else.  Nope, I'm not somwhere else, I am someWHEN else!")