# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



adv = Adventure.create(title: "The Forest Walker", author: "Stephen")

adv.pages.create!(name: "start", text: "You've taken a wrong turn while hiking through the redwoods, and have been separated from your group.  Fear does not find you, though, as the day is still young and has been pleasant so far.  A bit of exploration wouldn't hurt.  After a few moments of clearing brush and looking for a path, you find yourself in a spot where scattered beams of sunlight have punched through the forest canopy, illuminating a wide open area.  A river runs through here, and over it spans a [[fallen tree trunk|river_cross]] bathed in the sun's rays, particles dancing in the light.  The only other sensible road to take is the [[path|end]] you were looking for, plain and travel-worn.  You believe it will lead you back to your friends.")

adv.pages.create!(name: "river_cross", text: "You made the courageous choice to cross the river, and upon hopping off the log on the other side, you notice a small walkway through the foliage, previously hidden from view.  Stepping through it, you come upon a clearing, bathed in sunlight, colored the healthiest green you have ever seen, and the air punctuated with bird-songs.  Striding towards you is a giant of a man, his beard green and mossy, his skin like tree bark.  'I am the Forest Walker,' he says to you.  'You have made a choice, and have found my home.  For that, I give to you this special acorn.'  He takes an acorn out of his pocket-- it is larger than usual acorn and seems to almost glow with a deep and subtle brilliance.  'There is still hope for this garden; your kind can still be its gardeners.  This will help your kind restore it.'  With that, he motions to the side, where a maze of vines unravel to reveal a [[path|end]], bright and green.  'There is your road back home.'  He says, before walking away.")

adv.pages.create!(name: "end", text: "The path you took has successfully led you back to your friends, and the world that you know.  Your adventure has ended, and you now possess whatever it has taught you.")

lib1 = Library.create(url: "http://www.storytime.com")
lib2 = Library.create(url: "http://www.moarstories.com")