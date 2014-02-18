# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adv = Adventure.create!(:title => "Drew's Test Adventure",
	:author => "Drew")
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[enter the room|first]] or [[leave the house|end]]")
adv.pages.create!(:name => "first",
  :text => "You have entered the room and out of the left corner a wild boar comes charging at you! You either [[grab your swiss army knife from your pocket|second]] or [[run back out the door that you came through|third]] !")
adv.pages.create!(:name => "second",
  :text => "A swiss army knife? Your crazy that won't save you against a wild boar. Your dead.")
adv.pages.create!(:name => "third",
  :text => "You left? Ok well game over")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")


