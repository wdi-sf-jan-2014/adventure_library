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

adv = Adventure.create!(:title => "Hungry Ham", :author => "The Ham")
adv.pages.create!(:name => "start", :text => "This is a text adventure which begins right now!
  I can't wait to [[see what happens next|page1]]")
adv.pages.create!(:name => "page1", :text => "The ham is hungry and has to decide what to eat.
  Will it be a salad, a slice of pizza, or a burger? [[see what happens next|end]]")
adv.pages.create!(:name => "end", :text => "All three...he's a ham!")

adv = Adventure.create!(:title => "Friday Decisions", :author => "WDI Student")
adv.pages.create!(:name => "start", :text => "This is a text adventure which begins right now!
  I can't wait to [[see what happens next|page1]]")
adv.pages.create!(:name => "page1", :text => "It's Friday and your specs aren't passing.
  Do you [[continue to code|codepage]] or [[participate in happy hour|hhpage]]?")
adv.pages.create!(:name => "codepage", :text => "You worked on it for another 15 minutes and still can't get it to pass.
  [[Keep coding|codeagain]] or say F it and [[go to happy hour|hhpage]]? ")
adv.pages.create!(:name => "codeagain", :text => "Come on take a break! You need it!")
adv.pages.create!(:name => "hhpage", :text => "Cheers!")