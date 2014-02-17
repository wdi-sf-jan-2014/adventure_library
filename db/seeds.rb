# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adv = Adventure.create!(:title => "Lorem Hipstom Chaos",
	:author => 'Joel', :guid => "CVQ8KxmOmBsQeg")

adv.pages.create!(:name => "start",
  :text => "Cray qui delectus anim pour-over [[fashion axe.|two]]")
adv.pages.create!(:name => "two",
  :text => "Leggings eu freegan swag [[Blue Bottle.|three]]")
adv.pages.create!(:name => "three",
  :text => "90's master cleanse hashtag deserunt, sint incididunt synth chillwave [[fashion axe iPhone?|four]]")
adv.pages.create!(:name => "four",
  :text => "Anim art party tempor cornhole. Whatever bicycle rights [[elit plaid...|end]]")
adv.pages.create!(:name => "end",
  :text => "banh mi proident fingerstache artisan post-ironic. PBR&B laboris Banksy, consequat vero Tonx High Life literally shabby chic Cosby sweater chambray enim. ")


 

