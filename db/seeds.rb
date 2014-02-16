# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adv = Adventure.create!(:title => "Nikki's Test Adventure",
	:author => "Nikki Anderson")
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")

f_adv = Adventure.create!(:title => "Git Commit: Life or Death ",
  :author => "Nikki (via nightmare)")
f_adv.pages.create!(:name => "start",
  :text => "You are working on a mini-project like ususal, but this time commits can result in blood dripping from your faucet (gross and creepy, I know).  Every commit, you have to check the faucet.  Good commits run water, bad mistakes mean blood.  Do you want to [['work at home'|home]] or [['work at GA'|GA]]?")
f_adv.pages.create!(:name => "home",
  :text => "You are working at home, distractions abound.  You're not getting much done, obviously.  You have a bad feeling about this mini-project, but you don't want to trek all the way to GA yet.  You can [['try the cafe'|cafe]], [['move to the kitchen'|kitchen]], or [['git commit'|gcommit]] to pretend like you've accomplished something.")
f_adv.pages.create!(:name => "GA",
  :text => "Good choice. The faucet only runs clear here and nobody gets hurt.")
f_adv.pages.create!(:name => "cafe",
  :text => "You ended up eating brunch, hit a food coma, and never made a single commit.  You're out of choices now.  Way to go.")
f_adv.pages.create!(:name => "kitchen",
  :text => "Seriously?  You know you need to leave your house to focus. Ready to [['work at GA'|GA]] or try a [['git commit'|commit]]?")
f_adv.pages.create!(:name => "gcommit",
  :text => "Oh no, the faucet is dripping blood.  Make it stop!!! Do you want to [['wake up from this nightmare'|end]] or [['hustle to the Hattery'|GA]]")  
f_adv.pages.create!(:name => "commit",
  :text => "You really messed up and commited all your secrets and have empty files everywhere.  The faucet of death is upon you.
\n\n
[['end the nightmare'|end]], please.")
f_adv.pages.create!(:name => "end",
  :text => "Yikes, that was tragic.  Good think you are awake now.")