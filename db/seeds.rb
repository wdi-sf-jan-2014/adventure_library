
library = Library.create!(url: "/adventures", name: "Eli's Library")

adv = library.adventures.create!(:title => "Homey Gee the Honey Bee's Hella Cool Cali Adventure",
	:author => "Eli", :guid => SecureRandom.urlsafe_base64(10))
adv.pages.create!(:name => "start",
	:text => "This is the beginning of Homey Gee the Honey Bee's Hella Cool Cali Adventure [[go to pg1|pg1]]")
adv.pages.create!(:name => "pg1",
  :text => " Homey Gee the Honey Bee lived in a tree.  He was always a gee.  His family, a lineage of gees. 
  He lived the dream while chasing the cream. The honey king!... One day, he decided to move to Cali [[go to pg2|pg2]]")
adv.pages.create!(:name => "pg2",
  :text => " After escaping his keepers, Homey Gee successfully made it to Cali. [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "California Sunshine in the Summertime!  Homey Gee the Honey Bee is officially chillin'.  The End.")

