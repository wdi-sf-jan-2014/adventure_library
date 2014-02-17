# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adv = Adventure.create!(:title => "We Are All Vassals of the Lizard Men",
    :author => "Matthew Lopez")
# adv.pages.create!(:name => "start",
#     :text => "Beggars can't be choosers, thought Paulo as he carefully, quietly unclipped a pair of heavy linen deel robes from the sagging clothesline. He wasn't partial to their particular shade of faded olive, or perhaps distressed moss, but then again neither was he partial to freezing to death naked in the [[Mongolian karst.|two]]")
# adv.pages.create!(:name => "two",
#     :text => "The line was no more than ten paces from the ger and Paulo feared a sudden release of the line would cause a 'twang' audible through the tent's stretched fabric wall. He'd been staking out the family of goat herders -- no doubt part of the cultish back-to-the-earth movement that had swept much of Central Asia over the past few decades -- for hours from a rocky rise several hundred meters away. Now, as the sun set, a late Autumn evening shed its days temperature into space and the fifteen or so adults and children crammed inside for supper (followed by at least an hour of the wailing and gnashing that that they called prayer) he had no choice but to make a move to pilfer the long coats and get [[as far away from these dangerous zealos as possible.|three]]")
# adv.pages.create!(:name => "three",
#     :text => "Bundled in his ill-gotten robes Paulo slinked back towards the high rocks to further consider his situation. On his immediate mind was the not inconsiderable odor of goat eminating from his clothing that ensured every predator within several kilometers would be aware of his presence shortly. Well, at least someone -- or, more accurately, something -- [[would be looking for him.|four]]")
# adv.pages.create!(:name => "four",
#     :text => "As he lowered himself into a wind break between two sharply split boulders, Paulo's mind raced in an attempt to put together the pieces of what happened to him. If the geography and inhabitants were any indication, he'd woken in the western reaches of Mongolia, hundreds of miles away from Ulaanbaatar. How many ways, he thought, can a visiting (well, exiled) physicist to the National University of Mongolia fuck up to land himself hundreds of miles away from the capital [[without any memory of travel?|five]]")
# adv.pages.create!(:name => "five",
#     :text => "[[|]]")
adv.pages.create!(:name => "start",
    :text => "To you who are reading this story, I implore you to peel your eyes from these words, step back and realize that YOU are the ones living in a fiction: the fiction being written in the blood of humans by the insidious race of [[Lizard Men from Tau Alpha Ceti.|two]]")
adv.pages.create!(:name => "two",
    :text => "Bill Clinton, J. Edgar Hoover, Pope John Paul II, Sergio Mendez, just to name a few perfidious humans that have assisted the Lizard Men over past decades to systematically [[enslave our race.|three]]")
adv.pages.create!(:name => "three",
    :text => "Do the Lizard Men walk amongst us? Of course they do, but you'll never know it by their outward appearance. They have no visible tails or long, greenish snouts and flicking tongues. Instead, they wear the husks of deceased people, pilfered from the [[depths of our morgues.|four]]")
adv.pages.create!(:name => "four",
    :text => "Three Mile Island, Minamata, Bhopal, the meltdown of Fukushima Daiichi: each environmental disaster has been orchestrated expertly by the sinister Lizards and their treacherous human allies, who are promised riches and fame [[in return for their allegiance.|five]]")
adv.pages.create!(:name => "five",
    :text => "They are changing our planet to be more like their own world: these Lizards have come accustomed to living on a polluted garbage pile floating through space and they want to terraform our planet to be more like their own. They have travelled across light years via wormhole bridges (endpoints in the basement of the White House, Buckingham Palace and a farmhouse near the Hague) to get at our abundant planetary resources in order to fuel their expansion [[into this sector of the galaxy.|six]]")
adv.pages.create!(:name => "six",
    :text => "What can we do to fight back? First, we must organize raids to close the wormholes by which the Lizard agents enter our world. This can be accomplished by depriving them of the exotic matter generators (what do you think the LHC is really for?) that [[provide the energy for their gates.|seven]]")
adv.pages.create!(:name => "seven",
    :text => "Then, when the Lizards are cut off from home, we rip off their masks and reveal them for all the people's of Earth to see. In panic the Lizards will try to fortify, but this foolish action will only serve to reveal more of their numbers. As for the human collaborators, [[no punishment could be harsh enough.|eight]]")
adv.pages.create!(:name => "eight",
    :text => "When humans banish the Lizard Men back to the filthy rock they call a homeworld I predict an era of peace to last a thousand years. That era of peace will be shattered, though, when an army of future space marines tear across the galaxy to the Lizard homeworld and blast it into radioactive oblivion and hunt down the remains of their civilization from [[the arms of Orion to the Magellenic Clouds.|end]]")
adv.pages.create!(:name => "end",
    :text => "So, again, I say unto you: wake up! Don't you see? It's clear as day that we are surrounded by Lizard Men and that the fate of the world hangs in the balance! In conclusion...shit, what was that noise...cutting their way into my bunker using shaped charges...there's not much time you hav to tget the messag[censored][censored][censored][censored][censored][censored]")

# name = "Matt"

# library = Library.create(url: "http://intense_squaredance_1234.heroku.com")

# adv = Adventure.create!(:title => "#{name}'s Test Adventure",
# 	:author => "Matthew Lopez")
# adv.pages.create!(:name => "start",
# 	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
# adv.pages.create!(:name => "end",
# 	:text => "Wow that adventure was amazing!")