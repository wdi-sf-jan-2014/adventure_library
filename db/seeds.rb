
library = Library.create!(url: "/adventures", name: "eli's Library")

adv = library.adventures.create!(:title => "eli's Test Adventure",
	:author => "eli", :guid => SecureRandom.urlsafe_base64(10))
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")

