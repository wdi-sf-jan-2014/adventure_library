# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
name = "Kai"

# libraries
Library.create!([
  # { url: "http://adventures-with-raphael.herokuapp.com" },
  # { url: "http://guarded-ocean-2883.herokuapp.com" },
  # { url: "http://adventure-kaibrary.herokuapp.com"},
  { url: "http://eric-adventure-library.herokuapp.com/"}
])
#/libraries

# basic adventure
adv = Adventure.create!(
  title: "#{name}'s Test Adventure",
  author: name,
  guid: SecureRandom.urlsafe_base64(10)
  )

adv.pages.create!(
  name: "start",
	text: "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]"
  )
adv.pages.create!(
  name: "end",
	text: "Wow that adventure was amazing!"
  )
# /basic adventure


# Morning Commute
morning_commute = Adventure.create!(
  title: "Morning Commute",
  author: name,
  guid: SecureRandom.urlsafe_base64(10)
  )

morning_commute.pages.create!(
  name: "start",
  text: "You just rolled out of bed somewhere in Oakland. You walk to the bathroom in a groggy daze, trying not to trip over your dog on the way. You brush your teeth, throw on some acceptable clothes, and grab your bag. What next?\n\n[[get on bart!|bart]]\n[[take the bus!|bus]]"
  )

morning_commute.pages.create!(
  name: "bart",
  text: "Oh no, there's a fire in the transbay tube (again). Bart's shut down until further notice!\n\n[[take the bus|bus]][[go home|home]]\n"
  )

morning_commute.pages.create!(
  name: "home",
  text: "Womp. Guess you're working from home today!"
)

morning_commute.pages.create!(
  name: "bus",
  text: "There's been a fire in the transbay tube, and BART's not running! Because of this, the bus is *packed*. You just manage to get on, but you're smashed between an old man with terrible breath and a 20-something carrying a Chiuaua. How do you handle it?\n\n[[Ugh!|ugh]] I can't handle this. I'm gonna squeeze into another part of the bus.\n[[Whatever.|whatever]] I'll just blast my headphones and bury my nose in my scarf."
)

morning_commute.pages.create!(
  name: "ugh",
  text: "As you're muscling through the crowd, the Chihuahua starts barking, which leads the smelly old guy to let out a heaving passive aggressive sigh right into your face. Your eyes start watering, and you can't see. You put your hands out in front of you to get your bearings, but there's nowhere for them to go. You accidentally poke someone in the eye. They start yelling at you, droplets of spittle landing on your chin and cheek. The bus driver, at her wits' end with this morning's chaos, pulls the bus over and demands that that the two of you exit immediately. Frazzled by the whole experience, you get off and walk all the way home."
)

morning_commute.pages.create!(
  name: "whatever",
  text: "You've managed to create an effective sensory deprivation chamber for yourself, and and you blissfully float along all the way to the transbay terminal. But when you arrive in the city, you're still pretty far from your destination near 16th and Mission BART. How do you finish your trip?\n\nGrab a [[bike|bike]] from a city bike share rack.\nGet on another [[bus|bus2]]"
)

morning_commute.pages.create!(
  name: "bike",
  text: "Ahhhh, all this fresh air is a nice change from that crowded bus. You get to work feeling energized, and have an insanely productive day. Congratulations!"
)

morning_commute.pages.create!(
  name: "bus2",
  text: "This bus, too, is packed to the brim. There's little air or room to move, and it seems your stomach was a bit jostled from the day's first harrowing bus ride. You start to feel nauseous, and have to get off the bus to avoid throwing up onto the shoulders and faces of a densely packed group of strangers. Eep! You call in sick, take a breather at a cafe, and catch a cab back home."
)
# /Morning Commute