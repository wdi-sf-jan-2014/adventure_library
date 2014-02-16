# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adv = Adventure.create!(:title => "A Story Through The Melodies",
	:author => "Sofya")
adv.pages.create!(:name => "start",
	:text => "We find a Fool On A Hill waiting for Sgt. Pepper & The Lonely Hearts Club Band.  They arrive in a T-Bird.  
  The fool decides he needs to get his girlfriend back and thinks 'I can do this [[With A Little Help From My Friends|page1a]].
  And as they talk, a fire starts and Sgt. Pepper screams 'AHHH!, I'm [[Blinded By The Light|page1b]]!'")
adv.pages.create!(:name => "page1a",
	:text => "The band comes together to play their last song in Penny Lane, outside of the fool's girlfriend's flat.  Suddenly, Jude appears.
  Sgt. Pepper walks away to say [[Hey Jude|page2a]] while the fool goes to look for [[Eleanor Rigby|page2b]] instead.")
adv.pages.create!(:name => "page1b",
  :text => "The fire is blinding.  The fool and his band scream 'Mamma Mia!' and turn to run away.  Suddenly, a single stranger in a hat blocks 
  their way and asks 'Can you keep my Dirty Little Secret?'  The fool turns and says '[[I Can|page2c]]!' but Sgt. Pepper doesn't trust the stranger.
  He yells '[[Move B*tch|page2d]]!' and begins to charge.")
adv.pages.create!(:name => "page2a",
  :text => "The conversation between Sgt. Pepper and Jude is a quick Hello Goodbye.  Then, Lady Madonna appears and says their music is Getting 
  Better and that they should not end the band.  They take this sign and begin planning their Revolution...")
adv.pages.create!(:name => "page2b",
  :text => "The fool finds her down The Long And Winding Road.  The fool says We Can Work It Out and Eleanor responds 'I Want To Hold Your Hand'.
  The extact fool takes his Eleanor by the hand and leaves the band.  They go and travel Across The Universe for the rest of their days.")
adv.pages.create!(:name => "page2c",
  :text => "The stranger says 'I Shot The Sherif, but my buddy and I here...We Didn\'t Start The Fire!'  The fool smiles and says 'As much as My 
  Name Is Jonas and I Believe I Can Fly, you must be telling the truth!  But we are Forever Young and do not care.'  The stranger then tips his 
  hat.  As he turns to leave he says 'You must then be Waiting On The World To Change' and leaves the fool and his Lonely Hearts.")
adv.pages.create!(:name => "page2d",
  :text => "Sgt. Pepper then goes to Push the strainger into the Ring of Fire.  The stranger falls in screaming 'It\'s becoming Harder To Breathe!  
  Why!!?!??'  Sgt. Pepper bellows 'Because there is no Smooth Criminal in My Little Town!  Because We Are Young and you are Radioactive!  That's 
  why...'  The fool, now impressed, forgets about his girl trouble and ushers his friends away saying 'You all can have Whatever You Like...the first 
  round is on me!'")