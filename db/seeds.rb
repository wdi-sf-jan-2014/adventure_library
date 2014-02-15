# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adv = Adventure.create!(:title => "Rafis Test Adventure",
	:author => 'Rafi', guid: "BCm-soRZndUAew")
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")

adv2 = Adventure.create!(title: "Did LeBron James Throw the Last Two Games Against the Celtics?",
  author: 'Cleveland', guid: "xW2ULZWt65rlbw")

adv2.pages.create!(name: "start",
  text: "I don't get why this isn't being talked about more, to me it was so obvious.
LeBron James and his 'team' of advisers had a plan, and they executed it. The plan was to form a justifiable escape route out of Cleveland. A way to get out of Cleveland without everyone killing him for 'not caring about winning.  A way for him to say, 'My team just wasn't good enough in Cleveland, I have to go where I'd feel I have a better chance of winning.'
They pulled it off. [[See the plan|plan]]")

adv2.pages.create!(name: 'plan',
  text: "Force your team to win the game (which they can't) but do just enough to make it look like it's not too obvious you're throwing the game, but when momentum is on the line, throw it. Executed PERFECTLY. Watch the tape. [[read about game 5|game5]]")

adv2.pages.create!(name: "game5",
  text: "LeBron comes out dishing, not attacking at all. But they were at home so his teammates were actually getting it going. His only option was to get off the ball, totally uninvolved, so that his team would not be able to surge off him and make the game too close.
What does he do? Watch LeBron in Game 5, he spent more time standing in the corner away from the action than I've ever seen him spend in any game.
Many NBA experts have already said the same thing, not only was he standing around off the ball more than ever (what does an elbow injury have to do with that?) but when he did get the ball, he would swing it to a sometimes completely surprised teammate who was in no better position to create a shot than LeBron was when it left his hands. This play is not due to an injury, this is more than that.
With an injury, you're taking the shots, but they just aren't falling. By the way, did you notice in Game 5 when he did take shots they were Vince Carter-esque: Fading back for no reason (which he never does) and missing by a foot? [[read about game 6|game6]]")

adv2.pages.create!(name: 'game6',
  text: "Ok, everyone is suspecting you. What do you do? Make sure you stuff the stats so that it's not too obvious, but when it counts, make sure Boston gets the momentum play.
EXECUTED PERFECTLY. [[read about phase 2|plan2]]")

adv2.pages.create!(name: 'plan2',
  text: "LeBron comes out with a few dunks to quickly quell the notion that something is 'up.'  Ok, hes going to try to play it cool tonight. LeBron starts driving to the basket in the first half to show that he's being aggressive. But what happens on 50% of the drives? He gets tied up, stripped, etc.
This almost never happens to LeBron. He was fumbling the ball so much on drives, what does that have to do with an elbow? Sure, credit the Celtics defense, but LeBron was clearly not going as hard as he usually goes when driving to the hole. He was simply leaving the ball out there for people to strip.
In the second half, Boston starts to pull away. Every time the Cavs had an important possession, LeBron would throw the ball away. One play in particular, he threw a cross-court pass to Anthony Parker coming off a screen, who was clearly coming out to the top of the court, but LeBron threw the pass to the corner. There was no way Parker would have gone to that corner. That was the most clear example of throwing the game of the night. That was not a turnover on accident. Watch the tape, I don't care what anyone says.
Ok, but it's getting obvious again that LeBron is fading, its time to show a little fight. What does he do? Come down two straight possessions and hit two straight 3's to pull his team back. That elbow sure did look bad on those perfect shots! Riiiight.
Now if you noticed, LeBron's body language after those shots was totally bizarre. What do you expect from LeBron after plays like that? Firing up his teammates? 'LETS GO!' etc, excited, 'We can do it!' right? No. Not at all. Actually LeBron looked extremely nervous, his hands were damn near shaking, like he was thinking, 'That might have been too much, we are really close now.' 
Watch the tape. What do you do next time down the court? Turn it over. Because if you really want to win, you got to make the next play, or at least attempt to. But if you turn it over and Boston scores, the momentum and game quickly shifts back to Boston.
Mission Accomplished. [[see the move|move]]")

adv2.pages.create!(name: 'move',
  text: "Also, did LeBron look like he was upset to any of you after the game? Not to me, not at all. He spoke the words he was supposed to speak, but there was no feeling behind them.
Also, interesting that before his press conference, he called for his 'team' of advisers to meet with him in a closed-off locker room. I wonder why? Probably feeling some nerves after what he just did, and needed some advice on how to approach the media, what to say, etc.
The PLAN is to become a billionaire, and THE PLAN is to go to New York to do it. 
Anyone questioning LeBron's ability to win playoff games after these performances is a damn fool. If he wanted to, he could have single- handily dismantled the Celtics in both these games.
But he has a different agenda, he wants to win, but he wants to do it on the big stage. He knew winning a title in Cleveland this year would not allow him to leave, that is why he wanted to win one so badly last year. He could still have won a chip for his city and justified leaving after losing this year. Remember how mad he was after the game last year? He didn't even shake the Orlando players' hands. That's the type of competitor LeBron is, think about it folks, It's so obvious it's not even funny [[see the end|end]].")


adv2.pages.create!(name: 'end',
  text: "Welcome to New York, LeBron James.")