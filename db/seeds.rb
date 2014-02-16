# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# adv = Adventure.create!(:title => "#{name}'s Test Adventure",
# 	:author => name)
# adv.pages.create!(:name => "start",
# 	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
# adv.pages.create!(:name => "end",
# 	:text => "Wow that adventure was amazing!")

adv = Adventure.create!(:title => "PB&J Love Story",
	:author => "PB&J junior", :guid => "samplesample")
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see what happens!|chapter_1]]")
adv.pages.create!(:name => "chapter_1",
	:text => "PB met J in a park [[see what happens next!|end]]")
adv.pages.create!(:name => "end",
	:text => "They lived happily ever after - end")


adv = Adventure.create!(:title => "Adventure Time!",
	:author => "Finn the Human", :guid => "anothersample")
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see what happens!|chapter_1]]")
adv.pages.create!(:name => "chapter_1",
	:text => "PB met J in a park [[see what happens next!|end]]")
adv.pages.create!(:name => "end",
	:text => "They lived happily ever after - end")


