# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adv = Adventure.create!(:title => "A Story About Money",
	:author => "Sofya")
adv.pages.create!(:name => "start",
	:text => "You found a million bucks on the street. You decide [[To find whoever it belongs to and return the money|page1a]].
  But then you think you might keep the money and [[spend it on yourself|page1b]]!'")
adv.pages.create!(:name => "page1a",
	:text => "You find the person and [[return all the money|page2a]] or maybe you [[change your mind|page2b]] the very last moment.")
adv.pages.create!(:name => "page1b",
  :text => "You [[buy a house|page2c]] or [[open a new business|page2d]]!")
adv.pages.create!(:name => "page2a",
  :text => "You are a great person")
adv.pages.create!(:name => "page2b",
  :text => "You are a bad person")
adv.pages.create!(:name => "page2c",
  :text => "Congratulations.")
adv.pages.create!(:name => "page2d",
  :text => "Good luck")