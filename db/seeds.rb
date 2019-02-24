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
      {rid: 1,rule: "Predict if each character (41 total) will be alive or dead at the END of season 8. ONE point for each correct answer."},
      {rid: 2,rule: "If you predict the character will die, you have the option to predict if they become a Wight (Army of the Dead). Gain ONE extra point if you correctly predict if they become a Wight. Lose ONE point if you guess the character becomes a wight but does not become one."},
      {rid: 3,rule: "Correctly answer Bonus Questions for more points. (The answer no one does NOT have a double meaning. It cannot both mean Arya and literally no one at the same time.)"},
      {rid: 4,rule: "Points for dead and wight characters will be awarded as the season goes on. Alive characters will only be counted after the end of the season. Bonus Points will be awarded as they get answered"},
      {rid: 5,rule: "The Pool Entry Fee is $10 CAD / $7.50 USD. 60% to the winner, 25% to 2nd place, 15% to 3rd place."},
    ]
)

Faq.create(
  [
    {fid:1, question:"When is the payment due?", answer:"Payement is due by 12:00pm MT / 1:00pm CT on April 14th. If you have not payed by then, your predictions will be deleted."},
    {fid:2, question:"How do I make the payment", answer:"Payment can be made in person with cash, e-transfer to pierce.dejong45@gmail.com, or venmo Pierce-deJong. Please add the email and username you used to the e-transfer/venmo."}.
    {fid:3, question:"How long do I have to make my predictions?", answer:"You have until 1 hour before season 8 starts (6:00pm MT / 7:00pm CT, April 14th). At this point your preicitons will be submitted and you will not be allowed ot change them. "},
    {fid:4, question:"Why can't I see other peoples predictions?",answer:"You will only be able to see other peoples predicitons after the entry time has close on April 14th. Until then you will be able to only the average prediction for each character in the statistics tab"}.
    {fid:4,question:"How do character that have been resurrected work in the pool?", answer:"All characters that have been resurrected on the show are considered to be alive at the start of the season. E.g. Jon Snow, The Mountain, Beric Dondarrion."},
    {fid:5,question:"How do I predict the Night King and Viserion in the pool?", answer:"The Night King and Viserion are both considered alive at the start of season 8 and can only be predicted to be alive or dead at the end of the season. They cannot be predicted to become a wight."},
    {fid:6, question:"What happend if someone ties for first, second or third palce?", answer:"If two people tie for first place, the money from second place will be added to the first place pool and will split between the two people on first place. The third palce pool will then be given to the person in second place. I.e. the two people in first place will split 85% of the pot and the person in second will get the third place pot. If there is a three way or more tie for first place, the entire pool is split between the victors. If there is a tie for sceond place, the third place prize is added to the second place prize and us split between all who are in second place. If there is a third place tie, the thrid place pool is simply spliy between all of the persons in third place"},
    {fid:7, question:"What determines if a character is alive, dead or a  at the end of the season?", answer: "If a character is not seen killed on screen or explicitly stated as dead by another character (Stannis Baratheon), they are considered to be alive. If the character is seen to be killed on screen or said to have died off screen by another character, they are considered to to be dead. If a character has died and then risen as a wight, they are considered to be a wight for the remainder of the season no matter what happens to the character. (If a character is slain as a wight they are still considered to be a wight and not as dead)"},
    {fid:8, question:"",answer:"If you have any other questions or need clarification, contact Pierce at wwdeathpool@gmail.com. Please use the email you signed up when contacting Pierce. Please fully read the rules and faqs before contacting Pierce"},
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
    {did:1, name:"Jon Snow"},
    {did:2, name:"Arya Stark"},
    {did:3, name:"Sansa Stark"},
    {did:4, name:"Bran Stark"},
    {did:5, name:"Samwell Tarley"},
    {did:6, name:"Gilly"},
    {did:7, name:"Sam (Child)"},
    {did:8, name:"Gendry"},
    {did:9, name:"Davos Seaworth"},
    {did:10, name:"Daenerys Targaryen"},
    {did:11, name:"Jorah Mormont"},
    {did:12, name:"Missandei"},
    {did:13, name:"Grey Worm"},
    {did:14, name:"Brienne of Tarth"},
    {did:15, name:"Podrick Payne"},
    {did:16, name:"Lord Varys"},
    {did:17, name:"Sandor Clegane"},
    {did:18, name:"Gregor Clegane"},
    {did:19, name:"Tyrion Lannister"},
    {did:20, name:"Cersei Lannister"},
    {did:21, name:"Jaime Lannister"},
    {did:22, name:"Yara Greyjoy"},
    {did:23, name:"Theon Greyjoy"},
    {did:24, name:"Euron Greyjoy"},
    {did:25, name:"Bronn"},
    {did:26, name:"Melisandre"},
    {did:27, name:"Qyburn"},
    {did:28, name:"Tormund Giantsbane"},
    {did:29, name:"Beric Dondarrion"},
    {did:30, name:"Dolorous Edd"},
    {did:31, name:"Robin Arryn"},
    {did:32, name:"Lyanna Mormont"},
    {did:33, name:"Meera Reed"},
    {did:34, name:"Yohn Royce"},
    {did:35, name:"Edmure Tully"},
    {did:36, name:"Ghost"},
    {did:37, name:"Nymeria"},
    {did:38, name:"Drogon"},
    {did:39, name:"Rhaegal"},
    {did:40, name:"Viserion"},
    {did:41, name:"The Night King"},
    {did:41, name:"No One"},
  ]
)
