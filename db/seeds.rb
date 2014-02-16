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

lib1 = Library.create(url:"http://www.google.com")
lib2 = Library.create(url:"http://www.cnn.com")

# adventure story

  name = "Johny"
  adv1 = Adventure.create!(:title => "#{name}'s Morning After",
    :author => name)
  adv1.pages.create!(:name => "start",
    :text => "Johny hears his alarm ring at 6:00 on a Sunday... he groans and realizes it is way to early for the weekend. He wonders if he is [[going to sleep in|page1a]] or [[get up|page1b]]")
  adv1.pages.create!(:name => "page1a",
    :text => "My head is pounding, I'm going to [[sleep in|page2a]] instead.")
  adv1.pages.create!(:name => "page1b",
    :text => "Ahh I might as well walk this one off and '[[get up|page2b]]'")
  adv1.pages.create!(:name => "page2a",
    :text => "Johny sleep it off, unaware of the events around him")
  adv1.pages.create!(:name => "page2b",
    :text => "Johny ables out of his bedroom and wonders if what sounds better [[bloody mary|page3a]] or a [[gatorade|page3b]]")
  adv1.pages.create!(:name => "page3a",
    :text => "The hair of the dog is always better than facing the music... Johnny ambles out into a great Sunday Funday.")
  adv1.pages.create!(:name => "page3b",
    :text => "Johny wanders to the fridge, opens it and sees a note on the last gatorade \'please save\' signed by his ex. \'weird\' he thinks, and gazes at his roommates closed door and considers [[opening the door|page4a]] or [[just leaving|page4b]]")
  adv1.pages.create!(:name => "page4a",
    :text => "Johny kicks in the door finds his roommate asleep with his ex AAAAWKWARD.")
  adv1.pages.create!(:name => "page4b",
    :text => "Johny grabs the last gatorade moves back into his room and hits up craigslist, \'it\'s time to move on\' WHATEVER")









