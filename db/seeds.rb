
adv = Adventure.create!(:title => "Jay's Test Adventure",
	:author => "Jay")
adv.pages.create!(:name => "start",
	:text => "This is Jay's great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow Jay's adventure was amazing!")