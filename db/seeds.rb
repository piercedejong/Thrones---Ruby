# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rule.all.each do |r| r.destroy end
Drink.all.each do |d| d.destroy end
Death.all.each do |d| d.destroy end
Question.all.each do |q| q.destroy end
Character.all.each do |c| c.update(points: 0) end

Question.create(
  [
    {value:1,qid:1,text:"Is Daenerys pregnant? (Yes/No) ONE Point"},
    {value:1,qid:2,text:"Will The Hound and The Mountain do battle? (Cleganebowl 2K19) (Yes/No) ONE Point"},
    {value:2,qid:3,text:"Who (if anyone) wil ride Rhaegal? (no one is an answer) TWO Points"},
    {value:2,qid:4,text:"Who will be the the first character to die in season 8? (no one is an answer) TWO Points"},
    {value:3,qid:5,text:"Who kills the Night King? (no one is an answer) THREE Points"},
    {value:5,qid:6,text:"Who holds the Iron Throne at the end of season 8? (no one is an answer) FIVE Points"},
  ]
)

Rule.create(
    [
      {rid: 1,rule: "Predict if each character (38 total) will be alive or dead at the END of season 8. ONE point for each correct answer."},
      {rid: 2,rule: "If you predict the character will die, you have the option to predict if they become a Wight (Army of the Dead). Gain ONE extra point if you correctly predict if they become a Wight. Lose ONE point if you guess the character becomes a wight but does not become one."},
      {rid: 3,rule: "All characters that have been resurrected on the show are considered to be alive at the start of the season. E.g. Jon Snow, The Mountain, Beric Dondarrion."},
      {rid: 4,rule: "The Night King and Viserion are both considered alive at the start of season 8 and can only be alive or dead. They cannot be predicted to become a wight."},
      {rid: 5,rule: "Correctly answer Bonus Questions for more points. (The answer no one does NOT have a double meaning. It cannot both mean Arya and literally no one at the same time.)"},
      {rid: 6,rule: "Points for dead and wight characters will be awarded as the season goes on. Alive characters will only be counted after the end of the season. Bonus Points will be awarded as they get answered"},
      {rid: 7,rule: "The entry with the most points wins the entire pool. At 6:00pm MT / 7:00pm, CT on April 14th the form will close and you will NOT be allowed to change your entry. At this point you wil be allowed to view everyone elses predicitions."},
      {rid: 8,rule: "Pool Entry Fee is $10 CAD / %7.50 USD. 60% to the winner, 25% to 2nd place, 15% to 3rd place. If you have not paid by 12:00pm MT / 1:00pm CT on April 14th, your form will be deleted."},
      {rid: 9,rule: "Payment can be made in person with cash, e-transfer to pierce.dejong45@gmail.com, or venmo Pierce-deJong. Please add the email and username you used to the e-transfer/venmo."},
      {rid: 10,rule: "If you have any questions or need clarification, contact Pierce at wwdeathpool@gmail.com. Please use the email you signed up when contacting Pierce."},
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
  ]
)
