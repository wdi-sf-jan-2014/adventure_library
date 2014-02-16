# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
adv = Adventure.create(title: "This is Sylvie's adventure", author: "Sylvie Cottrell")
adv.pages.create!(:name => "start",
	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
	:text => "Wow that adventure was amazing!")



 adv1 = Adventure.create!(title: "No Time For Valentine", author: "Daniel Cottrell", guid: SecureRandom.urlsafe_base64(10))
 adv1.pages.create!( name: "start", text:   "It all started on a stormy night in the colorful streets of New York City; hardly fitting weather for Valentine’s Day Eve.<br/> I was leaving the mall after having bought a beautiful gold necklace for my girlfriend.<br/> I tell you I must have been too madly in love with her, for jewelry like that is far too expensive. I had never truly understood why women seemed to an item even more if it was more expensive—regardless of the change in quality.<br/>
Thankful for my waterproof jacket, I began trudging home under the pouring rain. I headed for my usual shortcut—a dark alley. As soon as I entered the darkness, I picked up my pace.<br/>
Suddenly, I heard a whisper that made me whip around faster than I thought imaginable. It sounded hurried, agitated, and frightened—if it had not sounded so pleading and anguished, paranoia would have kicked in and I would have fled. “Help!” it said.<br/>
I took a moment to examine the form looming before me. It looked to be a man, from his size and shape: his large, black coat was too big for him. The shadow that his hood cast on his face hid his features completely so I could not see a scrap of it. I stood tense, ready to use my fists or run away—New York City was not a place to be wandering the streets late at [[night|middle]]")
adv1.pages.create!(name: "middle", text:  "Abruptly, I realized that last I had checked my watch—and that could only be two minutes ago—it had been only eight fifty-three. “Excuse me?” I replied.<br/>
“I said help,” replied the man, in that same urgent tone. “I need your help.” He glanced behind him, perhaps checking whether anyone else was listening. “I need you, and only you, to do something for me. Our fates lie in your hands.” Our fates? He placed a silver wristwatch in my hands. A broken wristwatch. I frowned at it, and then looked up in turn to frown at him instead. “You must bring it back here at exactly nine o’clock tomorrow—PM that is—and I will be waiting for you. It is terribly important!”
I observed the cracked watch again. It looked like your average broken wristwatch, nothing more. Terribly confused, I looked up to tell him that such a task would conflict with the time of my date tomorrow. I gasped as I realized he was gone. What could this man possibly want? Did he think I would give up my Valentine just to return a cracked wristwatch to some dark alley? <br/>
Shaking my head, I resolved to pretend that this strange event had never happened. As soon as I came out of the dark alley, I cast the watch back into it. There. I was rid of it. No time to deal with another person’s problems, especially those of some random stranger.<br/>
I soon found myself at my apartment building. After climbing several flights of stairs, I arrived at my apartment. I kicked off my shoes, peeled off my shirt, placed the new necklace and my wallet on the table, and then jumped straight into bed. I closed my eyes and fell to a troubled sleep, full of nightmares of what might happen because I threw away the watch. I was terrified that night, though when I finally got up, I dismissed it all as foolishness.
As I walked to the kitchen to have breakfast, I suddenly felt something in my pocket; I frowned. I never put anything in it except for my wallet, and I could see it on the table right at that moment. Troubled, I slowly reached into my pocket. As I felt the touch of cool metal on my fingertips, I pulled the thing out and shrieked as [[my eyes fell on it.|end]]")       

adv1.pages.create!(name: "end", text: "The wrist-watch! The exact same wrist-watch, only it was fixed! Anger, confusion, and awe all tumbled through me, creating a wild jumble of mixed emotions. Why, unless I was going mad, I had cast that very wrist-watch into the dark alley. Either this man was playing a very elaborate prank on me, or it truly was terribly important and he needed help.<br/>
I resolved to search for him, starting with the dark alley. After throwing on a shirt, I jogged to it. I moved into the dark alley, with a stride much more confident than I felt. As I had hoped, I found the very man I was looking for. “Sir!” I barked. “What is this, a joke?!”<br/>
The stranger looked up at me, but in the shadows I could not see anything of his face. “It is not a prank,” he said coolly, not the slightest hint of his agitation from last night showing. “Both our lives are at stake.”<br/>
“But it is Valentine’s Day! I’m busy tonight; I have a date. Even if I did have the time, I wouldn’t participate in this... in this... foolishness!” <br/>
The man did not seem the slightest upset. But after all, I could not see his face. “You must arrange a different time for it, then. It is important. Oh, so very important.” <br/>
Disturbed, I replied in a shaky voice, “She—she would not be happy at all. M—my valentine would be so upset if—” <br/>
“Then,” he chuckled, “there is no time for the valentine!” He doubled up and roared with laughter, and I took a wary step back. When he had finished, he asked, “Would you rather be in love or be dead?” Then he turned around and walked out of my line of sight, as I stood there with my mouth hanging open. <br/>
A madman, surely. “A madman,” I said out loud to myself, though I knew I did not believe it.<br/>
So I went to my date; it went rather well, though I worried terribly much as nine o’clock passed. And now I write these final words on what I am sure is my deathbed. Remembering the stranger’s words in my head, I thought about whether I wanted to be in love, or be dead. “In love,” I resolved. “I would rather be in love.” And with that, I close my eyes for what I am sure is the last time.")
