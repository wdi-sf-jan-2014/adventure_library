# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
name = "Sam"
adv = Adventure.create!(:title => "#{name}'s First Adventure",
	:author => name)
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to:[[see the end|end]], [[go to next page|next]]")
adv.pages.create!(:name => "next",
  :text => "You are in a room. There is a bed, a desk and a door on the other side. I want to:[[sleep|bed]], [[study|desk]], [[Get outta here|door]], [[see the end|end]]")
adv.pages.create!(:name => "bed",
  :text => "You can't sleep on someone else's bed! I want to:[[study|desk]], [[Get outta here|door]], [[see the end|end]]")
adv.pages.create!(:name => "desk",
  :text => "You are not paying attention to details! There is no chair to sit on! I want to:[[sleep|bed]], [[Get outta here|door]], [[see the end|end]]")
adv.pages.create!(:name => "door",
  :text => "You chose wisely. Freedom! I want to:[[study|desk]], [[sleep|bed]], [[see the end|end]]")
# adv.pages.create!(:name => "start",
#   :text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")


adv1 = Adventure.create!(:title => "#{name}'s Quiz Show",
  :author => name)
adv1.pages.create!(:name => "start",
  :text => "You are on a quiz show! Who is Sherlock's sidekick? Is it:[[Dr. Idon'tknow|lose]],  [[Dr. Watson|Q2]], [[Dr. Daddy|lose]]")
adv1.pages.create!(:name => "Q2",
  :text => "You are correct! Moving on...... An apple a day keeps the/a \'blank\' away. Is it: [[doctor|Q3]], [[vet|lose]], [[a president|lose]]")
adv1.pages.create!(:name => "Q3",
  :text => "You are correct! Moving on...... What is the answer to life, the universe, and everything?. Is it: [[4222222211212|lose]], [[69|lose]], [[42|win]]")
adv1.pages.create!(:name => "lose",
  :text => "You lose...dumbass. [[go to end|end]]")
adv1.pages.create!(:name => "win",
  :text => "CONGRATULATIONS! YOU HAVE JUST ONE $1000000000MILLION BILLION GAGILLION DOLLARS. [[go to end|end]]")
adv1.pages.create!(:name => "end",
  :text => "Thanks for playing! see you next time")