
library = Library.create!(url: "/adventures")

adv = library.adventures.create!(:title => "eli's Test Adventure",
	:author => "eli")
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")

