name = "Sterling"
adv = Adventure.create!(:title => "#{name}'s Test Adventure",
	:author => name)
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")

name2 = "Waldo"
adv = Adventure.create!(:title => "#{name2}'s Test Adventure",
  :author => name2)
adv.pages.create!(:name => "start",
  :text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
  :text => "Wow that adventure was amazing!")

Library.create!(url: 'http://adventures-with-raphael.herokuapp.com')