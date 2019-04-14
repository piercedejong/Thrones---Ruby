# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rule.destroy_all
Faq.destroy_all
Drink.destroy_all
Death.destroy_all
Question.destroy_all
Character.all.each do |c| c.update(points: 0) end

Question.create(
  [
    {value:1,qid:1,glyph:"fas fa-baby",text:"Is Daenerys pregnant? ONE Point"},
    {value:1,qid:2,glyph:"fas fa-shield-alt",text:"Will The Hound and The Mountain do battle? (Cleganebowl 2K19) ONE Point"},
    {value:2,qid:3,glyph:"fas fa-dragon",text:"Who (if anyone) will ride Rhaegal? TWO Points"},
    {value:2,qid:4,glyph:"fas fa-book-dead",text:"Who will be the the first character to die in season 8? TWO Points"},
    {value:3,qid:5,glyph:"fas fa-skull-crossbones",text:"Who kills The Night King? THREE Points"},
    {value:5,qid:6,glyph:"fas fa-trophy",text:"Who holds The Iron Throne at the end of season 8? FIVE Points"},
  ]
)

Rule.create(
    [
      {rid: 1,rule: "Predict whether each character (41 total) will be dead or alive at the END of season 8. ONE point for each correct answer."},
      {rid: 2,rule: "If you think the character will die, you can predict if they become a wight or not. If you predict they will become a wight and they do become a wight, you gain ONE extra point on top of the point aleady gained for predicting their death. If you predict they will become a wight and they do not you lose ONE point. If you predict the charater will only die and they become a wight, you still get ONE point for correctly predicting their death."},
      {rid: 3,rule: "Correctly answer Bonus Questions for more points. (The answer no one does NOT have a double meaning. It cannot both mean Arya and literally no one at the same time.)"},
      {rid: 4,rule: "Points for dead and wight characters will be awarded as the season goes on. Alive characters will only be counted after the end of the season. Bonus Points will be awarded as they get answered."},
      {rid: 5,rule: "The Pool Entry Fee is $10 CAD / $7.50 USD. 50% to the winner, 20% to 2nd place, 10% to 3rd place."},
      {rid: 6,rule: "Each player is a member of a House. Each House has the opportunity to win 20% of the total pot split between all members equally. House points are awarded by cumulative character predictions and House questions asked before each episode."},
    ]
)

Faq.create(
  [
    {fid:1, question:"When is the payment due?", answer:"Payement is due by 12:00pm MT / 1:00pm CT on April 14th. If you have not paid by then, your predictions will be deleted."},
    {fid:2, question:"How do I make the payment?", answer:"Payment can be made in person with cash, e-transfer to pierce.dejong45@gmail.com, or venmo Pierce-deJong. Please add the email and username you used to the e-transfer/venmo."},
    {fid:3, question:"How long do I have to make my predictions?", answer:"You have until 1 hour before season 8 premieres, 6:00pm MDT / 8:00pm EDT, April 14th. (The countdown on the main page)"},
    {fid:4, question:"Can I change my predictions?", answer:"Yes, you can. You have until the countdown hits zero to change your predictions and bonus questions."},
    {fid:5, question:"Why can't I see my House and other players predictions?",answer:"You will only be able to see House and other players predicitons after the entry time has close on April 14th. Until then you will be able to only see the average prediction for each character in the statistics tab."},
    {fid:6, question:"How do character that have been resurrected work in the pool?", answer:"All characters that have been resurrected on the show are considered to be alive at the start of the season. E.g. Jon Snow, The Mountain, Beric Dondarrion."},
    {fid:7, question:"How do the Night King and Viserion work in the pool?", answer:"The Night King and Viserion are both considered alive at the start of season 8 and can only be predicted to be alive or dead at the end of the season. They cannot be predicted to become a wight."},
    {fid:8, question:"Can I change my House?", answer:"Yes, you can. The deadline is 2 hours before the premier starts (April 14th, 5:00pm MDT / 7:00pm EDT)"},
    {fid:9, question:"How do House character predictions get decided?", answer: "Each House will have a character prediction sheet based on the average consensus of the House members. E.g. If the House has 6 members and 3 say that Jon Snow will live, 2 say that he will die, and 1 says he will become a wight, the House prediction will be that Jon Snow is alive at the end of the season. If there is a tie between two predictions (alive/dead, alive/wight, dead/wight), then the character is predicted to be alive, if alive is one of the splits and is considered to be dead if the split is between dead/wight."},
    {fid:10, question:"How do House questions get answered?", answer:"Every House will get the same questions between each episode. Each House member has the opportunity to answer the questions and the answer with the most votes will be the Houses answer. You can view the You can view the"},
    {fid:11,question:"What happens if there is a tie for first, second or third place?", answer:"If two players tie for first place, the money from second place will be added to the first place pool and will split between the two players on first place. The third place pool will then be given to the player in second place. I.e. the two players in first place will split 70% of the pot and the player in second will get the third place pot. If there is a three way or more tie for first place, the entire pool is split between the victors. If there is a tie for second place, the third place prize is added to the second place prize and us split between all who are in second place. If there is a third place tie, the thrid place pool is simply split between all of the players in third place."},
    {fid:12,question:"What determines if a character is alive, dead or a wight at the end of the season?", answer: "If a character is not seen killed on screen or explicitly stated as dead by another character (Stannis Baratheon), they are considered to be alive. If the character is seen to be killed on screen or said to have died off screen by another character, they are considered to to be dead. If a character has died and then risen as a wight, they are considered to be a wight for the remainder of the season no matter what happens to the character. (If a character is slain as a wight they are still considered to be a wight and not dead)."},
    {fid:13,question:"Contact Information",answer:"If you have any other questions or need clarification, contact Pierce at wwdeathpool@gmail.com. Please use the email you signed up when contacting Pierce and fully read the rules and faqs before contacting."},
  ]
)

Drink.create(
  [
    {rule:"whenever the Stark, Lannister, Baratheon, or Targaren family names are mentioned"},
    {rule:"whenever your religion is mentioned. Pick one: The Old Gods, The Faith of the Seven, The Drowned God,  The Lord of Light, or The Many Faced God (Season 5)"},
    {rule:"whenever someone dies"},
    {rule:"whenever a major character dies", finish: true},
    {rule:"whenever there is nudity on screen"},
    {rule:"whenever someone on screen drinks"},
    {rule:"whenever the White Walkers are mentioned"},
    {rule:"whenever a White Walker or wight is on screen", finish: true},
    {rule:"whenever Hodor says 'hodor'", hardcore:true},
    {rule:"whenever someone is addressed as m'lord or lady, take 2 for your grace", hardcore:true},
    {rule:"whenever someone says 'Winter is coming'", hardcore:true},
    {rule:"whenever Jorah says 'Khaleesi'", hardcore:true},
    {rule:"whenever the word 'whore' is used", hardcore:true},
    {rule:"whenever the Martell, Tully, Greyjoy, or Tyrell family names are mentioned", hardcore:true},
  ]
)

Death.create(
  [
    {did:1, status:"none",name:"Jon Snow"},
    {did:2, status:"none",name:"Arya Stark"},
    {did:3, status:"none",name:"Sansa Stark"},
    {did:4, status:"none",name:"Bran Stark"},
    {did:5, status:"none",name:"Samwell Tarley"},
    {did:6, status:"none",name:"Gilly"},
    {did:7, status:"none",name:"Sam (Child)"},
    {did:8, status:"none",name:"Gendry"},
    {did:9, status:"none",name:"Davos Seaworth"},
    {did:10, status:"none",name:"Daenerys Targaryen"},
    {did:11, status:"none",name:"Jorah Mormont"},
    {did:12, status:"none",name:"Missandei"},
    {did:13, status:"none",name:"Grey Worm"},
    {did:14, status:"none",name:"Brienne of Tarth"},
    {did:15, status:"none",name:"Podrick Payne"},
    {did:16, status:"none",name:"Lord Varys"},
    {did:17, status:"none",name:"Sandor Clegane"},
    {did:18, status:"none",name:"Gregor Clegane"},
    {did:19, status:"none",name:"Tyrion Lannister"},
    {did:20, status:"none",name:"Cersei Lannister"},
    {did:21, status:"none",name:"Jaime Lannister"},
    {did:22, status:"none",name:"Yara Greyjoy"},
    {did:23, status:"none",name:"Theon Greyjoy"},
    {did:24, status:"none",name:"Euron Greyjoy"},
    {did:25, status:"none",name:"Bronn"},
    {did:26, status:"none",name:"Melisandre"},
    {did:27, status:"none",name:"Qyburn"},
    {did:28, status:"none",name:"Tormund Giantsbane"},
    {did:29, status:"none",name:"Beric Dondarrion"},
    {did:30, status:"none",name:"Dolorous Edd"},
    {did:31, status:"none",name:"Robin Arryn"},
    {did:32, status:"none",name:"Lyanna Mormont"},
    {did:33, status:"none",name:"Meera Reed"},
    {did:34, status:"none",name:"Yohn Royce"},
    {did:35, status:"none",name:"Edmure Tully"},
    {did:36, status:"none",name:"Ghost"},
    {did:37, status:"none",name:"Nymeria"},
    {did:38, status:"none",name:"Drogon"},
    {did:39, status:"none",name:"Rhaegal"},
    {did:40, status:"none",name:"Viserion"},
    {did:41, status:"none",name:"The Night King"},
    {did:41, status:"none",name:"No One"},
  ]
)
