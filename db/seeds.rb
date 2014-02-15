# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adv = Adventure.create!(:title => "#{name}'s Test Adventure",
	:author => name)
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")

adv = Adventure.create!(:title => "#{name}'s Tour of San Francisco",
 :author => Steve O)

adv.pages.create!(:name => "Start",
 :text => "It is a beautiful day in the beautiful city of San Francisco!  You decide to go out and enjoy the day.  
 Do you want to head North and go to the [[Golden Gate Bridge| page1a]], or South and go to [[Candlestick Park| page1b]]?")

adv.pages.create!(:name => "page1a",
 :text => "Since it is such a nice day there are a lot of people walking and riding bikes across the bridge.  
 Then you come to a point near the center where the SFPD aren't letting people past that point.  There is a 
 jumper hanging off the railing.  You really don't want to see what happens, so you decide to leave.  Do you want
  to head over to the [[Palace of the Arts| page2a]], or to the [[Conservatory of Flowers| page2b]]?")

adv.pages.create!(:name => "page1b",
 :text => "You get to Candlestick Park, but it isn't there.  It is demolition day and they have already blown it
  up.  Since a pile or rubble isn't that exciting to look at, you want to go elsewhere.  Do you want to stay with
   the sports theme and to to [[AT&T Park| page2c]], or head to the waterfront and watch the seals at the [[Wharf| page2d]]?")

adv.pages.create!(:name => "page2a",
 :text => "When you get to the Palace of the Arts, it is closed for a wedding.  You are getting pissed and decide
  to go somewhere that won't close.  Do you want to continue to enjoy the outdoors and go to the [[Conservatory of
  Flowers| page3a]], or to a bar in [[The Marina| page3b]]?")

adv.pages.create!(:name => "page2d",
 :text => "Once again, you chose a touristy spot and on a day like today the place is packed.  Plus, the seals aren't
  there.  Now you can't decide if you want to learn some history and go to [[Alcatraz| page3c]], or experience some 
  culture in [[Chinatown| page3d]].")

adv.pages.create!(:name => "page3h",
 :text => "You decide it would be nice to go out on the bay and walk down Embarcadero and wait in line for the ferry.
   It is so busy today and pretty late because of all the time you wasted wandering around earlier, so you can only 
   get a ticket on the last trip over.  While in one of the cells, you pull the door closed to experience what it would
    be like to be locked in there.  The door locks and you can't open it.  Your tour group wanders on and since they
     are all listening to the narrative tour on the headphones, they can't hear you.  It looks like you are going to
      really get to feel what it is like to be in there and have to stay all night until the tours begin [[tomorrow.| end]]")

adv.pages.create!(:name => "page3g",
  :text => "You are getting hungry and want to go get some dim sum.  While walking through all the shops, you pass a
  market that has some turtles.  You stop to play with them and one of them bites the tip of your finger off.  You grab
  your finger and head to the [[emergency room.| end]]")

adv.pages.create!(:name => "page2c",
  :text => "You get to AT&T Park to check out the Giant's home field, but they are beginning Spring Training and are 
  down in Phoenix, so you can't go to a game.  It is pretty cool, but really it is just a big brick building.  Not that
  exciting.  After walking around the outside of the stadium for five minutes, you are bored.  You think it might be a
  pretty nice time to go somewhere you have never been.  Do you want to go to [[North Beach| page3e]], or [[Coit Tower| page3f]]")

adv.pages.create!(:name => "page3e",
  :text => "You figure it is a great day for the beach, so you head to North Beach.  When you get there you realize that it isn't
  a beach, but a section of San Francisco called North Beach.  Anyway, you walk around a bit and realize that there isn't 
  much to do here but go to a restaurant, bar, or strip club.  None of these interest you, so you go home to [[watch tv.| end]]")

adv.pages.create!(:name => "page3f",
  :text => "You always see Coit Tower up on the hill, overlooking the city but have never been up there.  You head up the 
  hill, but it is closed for rennovation.  They are touching up the murals inside.  While you are up here you decide to take 
  a little time to enjoy the view.  While standing there a worker accidentally kicks a can of paint and it falls from the 
  tower and onto your head.  With a red face, from the paint not embarrasment, you head home to try to wash all the paint 
  [[off of yourself.| end]]")

adv.pages.create!(:name => "page2b",
  :text => "You get to the Conservatory of Flowers and everyting is in full bloom.  Huge flower beds packed with lots of 
  different colors.  There are people playing frisbee, there is a hippie drum circle, dogs and children running around.  
  You find a nice spot in between the flowers to have a seat and soak up some rays.  You lie back and get stung in the back!  
  You are deathly allergic to bees and were not planning on coming to bee haven, so did not bring your epi-pen.  At once, 
  you run back to your apartment to get your shot.  You make it before you die, but your back has swelled up so much that 
  you look like The Hunchback of Notre Dame.  After your hump goes down, there are still a couple of hours left in the day.  
  Would you like to go walk around [[Haight Street| page3c]], or head up to [[Twin Peaks| page3d]]")

adv.pages.create!(:name => "page3c",
  :text => "You get to Haight and start strolling along stopping in shops and enjoying the variety of people that Haight has 
  to offer.  One of the local Haight denziens offers some weed, and you figure why not.  After the day you've had thus far, 
  you figure this can only enhance this whole experience.  You pay him way too much and toke up.  Before long, all the 
  wierdos begin to freak you out and you become paranoid.  You must retreat to the sanctity of your home.  You buy a lot of 
    junk food on the way and just munch out the [[rest of the evening.| end]]")

adv.pages.create!(:name => "page3d",
  :text => "You head up to Twin Peaks to watch what is beginning to look like a beautiful sunset.  You find a spot on the 
  wall to wait and watch it develop.  The city looks so peaceful from up here.  Beautiful!  The sky is ablaze with shades 
  of pinks, reds, purples, oranges, yellows.  You stand on top of the wall to take a photo of the stunning sight.  While 
  standing up there, you get vertigo and fall.  You roll down the hill and hit your head on a rock.  You come to a few hours 
  later.  It is pitch black and you are in the middle of all the brush on the hillside.  You hear something rustling around 
  behind you.  It is a pack of coyotes!  You run down the hill, totally out of control.  You escape the hunting scavengers 
  and head home to [[ice up your head.| end]]")

adv.pages.create!(:name => "page3a",
  :text => "You head to Ocean Beach to enjoy some sand, sun, and surf.  You are sitting in the sand watching the surfers, 
  but less than an hour later the fog starts rolling in.  Pretty soon the fog horn is blasting and the sun is behind a grayish 
  curtain.  This sucks! You decide to [[go home.| end]]")

adv.pages.create!(:name => "page3b",
  :text => "You head to the Marina to find a bar to grab a beer and watch The Olympics.  Curling is on!  You begin to talk to 
  the guy next to you.  He shares the same affinity for curling that you have.  The two of you begin to make some wagers on 
    who will knock each other out.  The matchup becomes pretty intense, as do your emotions.  You begin to talk trash to your 
      barmate.  He gets angry and smashes a beer bottle over your head.  You have a severe laceration across your forehead.  
      The cops come to haul your friend away, and the ems to haul you to the [[ER for stitches.| end]]")

adv.pages.create!(:name => "end",
  :text => "This day sucked!  I'm going to bed!")



