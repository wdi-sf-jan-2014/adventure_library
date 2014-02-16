# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


adv1 = Adventure.create!(:title => "A Story Through The Melodies",
  :author => "Franco", :guid => SecureRandom.urlsafe_base64(10).to_s )
adv1.pages.create!(:name => "start",
  :text => "We find a Fool On A Hill waiting for Sgt. Pepper & The Lonely Hearts Club Band.  They arrive in a T-Bird.  
  The fool decides he needs to get his girlfriend back and thinks 'I can do this [[With A Little Help From My Friends|page1a]]'.
  And as they talk, a fire starts and Sgt. Pepper screams 'AHHH!, I\'m [[Blinded By The Light|page1b]]!'")
adv1.pages.create!(:name => "page1a",
  :text => "The band comes together to play their last song in Penny Lane, outside of the fool's girlfriend's flat.  Suddenly, Jude appears.
  Sgt. Pepper walks away to say [[Hey Jude|page2a]] while the fool goes to look for [[Eleanor Rigby|page2b]] instead.")
adv1.pages.create!(:name => "page1b",
  :text => "The fire is blinding.  The fool and his band scream 'Mamma Mia!' and turn to run away.  Suddenly, a single stranger in a hat blocks 
  their way and asks 'Can you keep my Dirty Little Secret?'  The fool turns and says '[[I Can|page2c]]!' but Sgt. Pepper doesn't trust the stranger.
  He yells '[[Move B*tch|page2d]]!' and begins to charge.")
adv1.pages.create!(:name => "page2a",
  :text => "The conversation between Sgt. Pepper and Jude is a quick Hello Goodbye.  Then, Lady Madonna appears and says their music is Getting 
  Better and that they should not end the band.  They take this sign and begin planning their Revolution...")
adv1.pages.create!(:name => "page2b",
  :text => "The fool finds her down The Long And Winding Road.  The fool says We Can Work It Out and Eleanor responds 'I Want To Hold Your Hand'.
  The ecstatic fool takes his Eleanor by the hand and leaves the band.  They go and travel Across The Universe for the rest of their days.")
adv1.pages.create!(:name => "page2c",
  :text => "The stranger says 'I Shot The Sherif, but my buddy and I here...We Didn\'t Start The Fire!'  The fool smiles and says 'As much as My 
  Name Is Jonas and I Believe I Can Fly, you must be telling the truth!  But we are Forever Young and do not care.'  The stranger then tips his 
  hat.  As he turns to leave he says 'You must then be Waiting On The World To Change' and leaves the fool and his Lonely Hearts.")
adv1.pages.create!(:name => "page2d",
  :text => "Sgt. Pepper then goes to Push the strainger into the Ring of Fire.  The stranger falls in screaming 'It\'s becoming Harder To Breathe!  
  Why!!?!??'  Sgt. Pepper bellows 'Because there is no Smooth Criminal in My Little Town!  Because We Are Young and you are Radioactive!  That's 
  why...'  The fool, now impressed, forgets about his girl trouble and ushers his friends away saying 'You all can have Whatever You Like...the first 
  round is on me!'")

adv2 = Adventure.create!(:title => "The Lord Of The Rings",
  :author => "Franco", :guid => SecureRandom.urlsafe_base64(10).to_s )
adv2.pages.create!(:name => "start",
  :text => "During a lazy day in the Shire, Frodo Baggins finds a small golden ring amongst the possessions his uncle Bilbo left him before 
  setting off to Rivendell.  This ring has an awesome power to it, driving Frodo to seclude himself in Baggend for weeks at a time.  
  One midsummer day, Gandalf the Grey arrives.  Frodo does not know if he should [[give the ring to Gandalf|page1a]] or if he should 
  [[keep it secret, keep it safe|page1b]].")
adv2.pages.create!(:name => "page1a",
  :text => "Gandalf takes posession of the ring.  He feels the strange power of which Frodo spoke.  Gandalf immediately recognizes the ring in 
  his hand as the One Ring of Sauron.  Gandalf knows the power within the ring and believes [[he can use the power to do good|page2a]].  
  However, as a guardian of Middle-Earth, Gandalf knows me must [[begin a quest to destroy the ring|page2b]]")
adv2.pages.create!(:name => "page1b",
  :text => "Frodo did not tell Gandalf of his ring.  He does share it with Samwise Gamgee, though.  When Sam sees the ring he tries to keep it 
  and Frodo goes crazy.  Sam helps Frodo to decide whether to [[tell Gandalf of the ring|page2b]] or to [[hide the ring|page2c]] from Frodo and 
  the rest of Middle-Earth.")
adv2.pages.create!(:name => "page2a",
  :text => "Deciding to try and manipulate the power of the One Ring, Gandalf begins to lose his mind.  He raises floods through-out the Shire and 
  sets Fangorn ablaze.  He finds and slays the Heir of Numenor as well as Saruman in Orthanc.  Gandalf then turns his rath on the elves, where he battles 
  Elrond and Galadriel as the rest of the elves flee to Valar in the west.  Gandalf chooses to take the lives of Elrond and Galadriel and let the remaining 
  elves escape.  As he lays waste to the kingdoms of men and elves, Gandalf uses one great spell to seal the dwarves in their mountain halls.  Soon 
  after Middle-Earth is bereft of life, Tom Bombadil makes an attempt to bring Gandalf down.  He too fails.  At the apparent end of the Third Age, 
  Sauron returns.  On the fields of Pelenor, Gandalf and Sauron compete for the dominion of Middle-Earth.  It is at this moment the One Ring betrays Gandalf 
  and the Fourth Age falls to the reign of Sauron.")
adv2.pages.create!(:name => "page2b",
  :text => "Gandalf comes to his senses before the One Ring can take a hold of him.  He explains to Frodo what the trinket actually is, and what it 
  means for the fate of the Shire and Middle-Earth.  Gandalf explains that the One Ring must be destroyed and that it can only be done so in Mount 
  Doom, in the heart of the lands of Mordor.  Frodo realizes what he must do, and he and Gandalf set plans to rid Middle-Earth of this terrible plague 
  once and for all...")
adv2.pages.create!(:name => "page2c",
  :text => "The day that Samwise comes to hide the ring, Frodo realizes how terrible he would feel without his precious ring.  He kills Sam, using 
  a fine elvish sword Bilbo left hanging on the wall of his study.  After Sam is dead, Frodo puts the ring on and flees the Shire.  He travels far 
  north and east, towards Agmar.  There Frodo finds he has strange new abilities.  He realizes objects in the world have begun bending to his will 
  and orcs do not hurt him.  Spending years roaming the country side, Frodo grows into his powers.  He can cross great rivers by moving them from 
  his way.  Mountains are no larger than ant hills and his small sword-arm is able to fell a tree in a single swing.  He has even attacked towns unprovoked.  
  Frodo meets a man named Strider who claims to be hunting a rogue hobbit for killing innocent people.  Frodo fights and slays Strider on the top of 
  Weathertop.  Soon after, Frodo finds Gandalf at Orthanc and Gandalf reveals that Frodo is being used by the One Ring in its attempt to serve Sauron and that he 
  slayed the last hope for men to rise against this evil.  Frodo makes it clear that he is the new evil and decides that it is time to strike.  He 
  destroys Gandalf and raises Orthanc down to the ground.  Saruman was still inside.  The elves get wind of what happened in Orthanc and decide to 
  put an end to Frodo.  Their attempts are fruitless and Frodo single-handedly defeats most of the combined forces of Elrond, Galadriel, and Thranduil.  
  The men of Gondor and Rohan attempt to help the elves, but are lost without a strong leader and perish.  Frodo remembers what Gandalf taught him 
  of the origin of the One Ring and decides to turn his might on Barad-dur.  With his small elvish sword, Frodo destroys the tower and causes Mount Doom 
  to erupt, laying waste to all of Mordor.  Finally, with the free peoples of Middle-Earth destroyed, Frodo travels to the Southfarthing and sits atop 
  the highest point of Erebor and enjoys the best long-bottom leaf pipe-weed in all of his new kingdom.")

adv3 = Adventure.create!(:title => "A Game Of Thrones",
  :author => "Franco", :guid => SecureRandom.urlsafe_base64(10).to_s )
adv3.pages.create!(:name => "start",
  :text => "The king Robert Baratheon is dead.  Speared by a boar on a hunting trip in the Kingswood.  While the entire of Kings Landing was mourning 
  for the loss of their king, the Hand of the King Ned Stark and the youngest brother of Robert, Renly Baratheon are talking on the bastillian.  
  Ned Stark shares his findings of the true geneology of Joffrey Baratheon and Renly extends an invitation for Ned to join him in taking the Iron Throne.  
  Ned must decide if he should [[stay at his post as Hand of the King|page1a]] or if he should [[join Renly|page1b]]")
adv3.pages.create!(:name => "page1a",
  :text => "Ned Stark confronts Cersei and reveals to her what he knows about Joffrey.  Cersei has Ned Stark captured, bound in chains, and stored 
  in the dungeons of the Red Keep.  It is in this dungeon that Ned Stark must wait for his public trial on the Steps of the Baelor.  After weeks of solitude 
  Ned is taken out into the center of Kings Landing and forced to apologize to King Joffrey for spreading slander about Lannisters and his birth.  Now King Joffrey 
  must decide to follow the plan his mother laid out and [[send Ned Stark to the Wall|page2a]] or [[act on his own accord|page2b]].")
adv3.pages.create!(:name => "page1b",
  :text => "Renly Baratheon leads Ned Stark and his daughters to Highgarden where his wife and boyfriend live.  Here Ned and Renly discuss ways at which 
  King Joffrey could be removed from the throne.  Ned and Renly realize they will need the combined strength of Highgarden, Winterfell, the Eyrie, and 
  maybe even the Iron Islands.  It dawns on Ned Stark that Catelyn does not know about his departure from Kings Landing and he has his daughters to worry 
  about before charging into open war with the Lannisters.  Ned has a son recently paralyzed and a Greyjoy ward to raise.  Ned things long and hard before 
  deciding to [[join Renly's army|page2c]] or [[return north to Winterfell|page2d]].")
adv3.pages.create!(:name => "page2a",
  :text => "Cersei and the Small Counsel decided that the easiest way to deal with Ned Stark was to send him back north, but beyond Winterfell.  Ned was to be sentenced 
  to service on the Wall.  Ned has a brother on the Wall and would not be against working to protect the realm.  He does not argue against his sentencing and begins the 
  arguous journey north to drop his daughters off at Winterfell and go find his place with Jon Snow at the Wall.  After a few years pass, the weather becomes extremely cold 
  even for the Wall.  Loud screeches are heard through-out the north, carried south with every burst of wind.  Soon the expansive, infinite dark north of the Wall begins 
  to steal stars from the night sky.  Every night men of the Watch would notice more and more blue dots populating the dark, frozen wasteland in front of them.  
  One night the blue dots started moving and then the horn was heard.  Three distinct blasts, telling all who could hear that the Others were coming.  Soon the ground at the foot of 
  the Wall was covered in Wrights.  The Watchmen had no way to defend Westeros and no kingdom would send troops to help.  Hope was fading fast as the Wrights and the Watchmen battled 
  and the Watchmen lost.  However, on a particularly trecherous day, a distinct blast was heard in the distance.  The sound did not come from a trumpet but rather a giant mammoth.  
  Over the hill, behind the battle field, an army of giants and Wildlings appeared.  Mance Rayder lead his rag-tag army of northern in habitants previously assembled to 
  take over Westeros to the aide of his former brothers.  Mance is a turncloak and now rides to save those who he abandoned.  Mance Rayder single handedly saves Westeros with his 
  army.  Due to the significance of his actions Mance was forgiven and allowed to rejoin the Watchmen of the Wall.  He took over as Commander.  Ned Stark, heavily injured during 
  the great Wright War, was permitted to return to Winterfell, where he immediately died from his injuries and was buried in the crypts with his fathers.")
adv3.pages.create!(:name => "page2b",
  :text => "Joffrey listens as his Small Counsel and decides to punish Ned Stark.  However, he has a more specific punishment in mind.  When Ned Stark finishes his apology to the crowd, 
  Joffrey order Ser Ilyn Payne to remove the head of Ned Stark.  In one fell swoop of Ice, Ser Ilyn Payne beheads Ned Stark in front of all of the citizens of Kings Landing.  This cruel 
  behavior by the king causes a massive rebellion from the north and all allies of the Starks and Winterfell.  Westeros divides itself and falls to constant wars between Lannisters, Baratheons, 
  Starks, Tyrells, and the Greyjoys.  Turmoil spreads across the land and with no end in sight...")
adv3.pages.create!(:name => "page2c",
  :text => "Ned decides to join forces with Renly.  Together they hatch a battle plan to dethrone Joffrey Baratheon and give the crown to Renly.  The two of them join the armies of 
  Highgarden and Winterfell and begin a march on Kings Landing.  Casterly Rock comes to defend the capital, causing a great war outside of Kings Landing.  Both sides are devistated 
  and left extremely weak afterwards.  However, before a clear winner emerges, Stannis Baratheon rides through with his army from Dragonstone.  Stannis slays both Renly and Joffrey and 
  claims the his throne by rights.")
adv3.pages.create!(:name => "page2d",
  :text => "Ned decides to not join Renly's attacks.  He has grown weary of the quabbles over an iron chair.  He decides that the people of the north would better be served by a leader 
  who cares for them and not his own personal gain.  Ned Stark and Winterfell seceded from Westeros, creating a state open for trade and travel but under no government from Kings Landing.  
  Under this new schematic, Winterfell stayed out of the Baratheon-Lannister battles.  The people of the North remained the most prosperous of Westeros and lived in peace until the end of 
  Ned Stark.")