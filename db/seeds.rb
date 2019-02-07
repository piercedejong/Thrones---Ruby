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
Question.all.each do |q| d.destroy end
Character.all.each do |c| c.update(points: 0) end


Question.create(
  [
    {qid:1,text:"Is Daenerys pregnant? (1 extra point)"},
    {qid:2,text:"Who kills the Night King? (2 points)"},
    {qid:3,text:"Who holds the Iron Throne at the end? (4 points)"},
  ]
)

Rule.create(
    [
      {rid: 1,rule: "Predict if each character will be alive or dead at the
END of season 8. 1 point for each correct answer."},
      {rid: 2,rule: "If you predict the character will die, you have the
option to predict if they become a Wight (Army of the Dead).
Gain one extra point if you correctly predict if they
become a Wight. Lose a point if you guess the character becomes a wight but does not."},
      {rid: 3,rule: "Correctly answer Bonus Questions for more points. (The answer no one does NOT have a double meaning. It cannot both mean Arya and literaly no one at the same time.)"},
      {rid: 4,rule: "The entry with the most points wins the entire pool. At 12:00am on April 14th the form will close and you will NOT be allowed to change your answers. At that point you will be able to see everyone elses forms"},
      {rid: 5,rule: "Pool Entry Fee is $10.00. 60% to the winner, 25% to 2nd place, 15% to 3rd place"},
    ]
)

Drink.create(
  [
    {rule:"whenever the Starks, Lannisters, Baratheons, or Targarens are mentioned"},
    {rule:"when your religion is mentioned. Pick one: The Old Gods, The Faith of the Seven, The Drowned God,  The Lord of Light, The Many Faced God (Season 5)"},
    {rule:"whenever someone dies"},
    {rule:"whenever a major character dies", finish: true},
    {rule:"whenever there is nudity on screen"},
    {rule:"whenever someone on screen drinks"},
    {rule:"whenever the White Walkers are mentioned"},
    {rule:"whenever a White Walker or wight is on screen", finish: true},
    {rule:"whenever Hodor says 'hodor'", hardcore:true},
    {rule:"whenever someone is addressed as mlord or lady, take 2 for your grace", hardcore:true},
    {rule:"whenever someone says 'Winter is coming'", hardcore:true},
    {rule:"whenever Jorah says 'Khaleesi'", hardcore:true},
    {rule:"whenever the word 'whore' is used", hardcore:true},
  ]
)

Death.create(
  [
    {did:1, name:"Jon Snow"},
    {did:2, name:"Arya Stark"},
    {did:3, name:"Sansa Stark"},
    {did:4, name:"Bran Stark"},
    {did:5, name:"Cersei Lannister"},
    {did:6, name:"Jaime Lannister"},
    {did:7, name:"Tyrion Lannister"},
    {did:8, name:"Daenerys Targaryen"},
    {did:9, name:"Yara Greyjoy"},
    {did:10, name:"Theon Greyjoy"},
    {did:11, name:"Euron Greyjoy"},
    {did:12, name:"Melisandre"},
    {did:13, name:"Jorah Mormont"},
    {did:14, name:"The Hound"},
    {did:15, name:"The Mountain"},
    {did:16, name:"Samwell Tarley"},
    {did:17, name:"Gilly"},
    {did:18, name:"Sam (Child)"},
    {did:19, name:"Lord Varys"},
    {did:20, name:"Brienne of Tarth"},
    {did:21, name:"Davos Seaworth"},
    {did:22, name:"Bronn"},
    {did:23, name:"Podrick Payne"},
    {did:24, name:"Tormund Giantsbane"},
    {did:25, name:"Qyburn"},
    {did:26, name:"Grey Worm"},
    {did:27, name:"Gendry"},
    {did:28, name:"Beric Dondarrion"},
    {did:29, name:"Daario"},
    {did:30, name:"Dolorous Edd"},
    {did:31, name:"Missandei"},
    {did:32, name:"Ghost"},
    {did:33, name:"Nymeria"},
    {did:34, name:"Drogon"},
    {did:35, name:"Rhaegal"},
  ]
)
