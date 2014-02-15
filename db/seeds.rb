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
  I can't wait to [[see what happens next|chapter1]]")
adv.pages.create!(:name => "chapter1", :text => "The ham is hungry and has to decide what to eat.
  Does he deciede on salad, a slice of pizza, or a burger? [[see what happens next|end]]")
adv.pages.create!(:name => "end", :text => "It's a no brainer, the ham chose the burger...he's a ham!")