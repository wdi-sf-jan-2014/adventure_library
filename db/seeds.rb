adv = Adventure.create!(:title => "Mike's Test Adventure",
	:author => "Mike")
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")

adv.create_library(url: "changethistoheroku.com", name: "Mike's library")

