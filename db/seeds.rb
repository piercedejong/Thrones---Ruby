# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Rule.create(
    [
      {rid: 1,rule: "Predict if each character will be alive or dead at the
end of season 8. 1 point for each correct answer."},
      {rid: 2,rule: "If you predict the character dead, you have the
option to predict if they become a Wight.
Gain one extra point if you correctly predict if they
become a Wight. Lose a point if you predict
Wight status incorrectly."},
      {rid: 3,rule: "Correctly answer Bonus Questions for more points"},
      {rid: 4,rule: "Entry with the most points wins the entire pool.
Submit up to 2 pool entries per person by April 13.
Pool Entry Fee is $10.00."},
    ]
)
