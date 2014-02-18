# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Adventure.delete_all
Page.delete_all
Library.delete_all

adv = Adventure.create!(:title => "Steve Marsh's Test Adventure",
                        :author => "Steve Marsh",
                        :guid => SecureRandom.urlsafe_base64(10))
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end", :text => "Wow that adventure was amazing!")

adv2 = Adventure.create!(:title => "A Walk in the Woods...",
                          :author => "Steve Marsh",
                          :guid => SecureRandom.urlsafe_base64(10))

adv2.pages.create!(:name => "start",
    :text => "There are some woods over there. Someone is walking through them. What will [[happen next|next_page]]?")
adv2.pages.create!(:name => "next_page",
    :text => "Yes. Indeed. Someone is walking through the woods. I think they are about to [[leave the woods|end]].")
adv2.pages.create!(:name => "end",
    :text => "That strange person did walk through and out of the woods.")


adv3 = Adventure.create!(:title => "A Haiku",
                          :author => "Steve Marsh",
                          :guid => SecureRandom.urlsafe_base64(10))
adv3.pages.create!(:name => "start",
    :text => "bagels on the porch<br> playing some Janes Addiction<br> Summer on The Shore")