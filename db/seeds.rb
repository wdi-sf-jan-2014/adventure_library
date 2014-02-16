adv = Adventure.create!(:title => "Mike B's Test Adventure",
	:author => "Mike B")
adv.pages.create!(:name => "start",
	:text => "Adventure stories, in general, suck!  So better get on with it... [[go to pg1|pg1]]")
adv.pages.create!(:name => "pg1",
  :text => "Adventure stories written by Mike B, really suck more than the average adventure story. [[see the pg2|pg2]]")
adv.pages.create!(:name => "pg2",
  :text => "This is a great text adventure which I'm going to end about now... [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")

adv.create_library(url: "http://stormy-sands-1901.herokuapp.com", name: "Mike's library")

