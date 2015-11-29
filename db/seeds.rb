# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.delete_all
Role.create(name: "Player")
Role.create(name: "Admin")
Role.create(name: "SuperAdmin")

Nationality.delete_all
Nationality.create name: "Polish", flag_img_path: "pl.gif"
Nationality.create name: "English", flag_img_path: "en.gif"

Tournament.delete_all

main = Tournament.create [
                      {
                          name: 'Main tournament',
                          phases: [
                              Qualification.new(
                                  number_of_rounds: 10,
                                  matches_per_round: 1, players_per_round: 1,
                                  player_fixed: true, phase_fixed: false
                              ),
                              DoubleKO.new(
                                  number_of_rounds: 64,
                                  matches_per_round: 3,
                                  players_per_round: 2,
                                  player_fixed: false,
                                  phase_fixed: true
                              ),
                              Final.new(
                                  number_of_rounds: 1,
                                  matches_per_round: 3,
                                  players_per_round: 3,
                                  player_fixed: false,
                                  phase_fixed: true
                              ),
                          ]
                      },

                  ]


User.delete_all
User.create [
                {
                    first_name: 'Super',
                    last_name: 'Admin',
                    roles: [
                        Role.find_by_name('SuperAdmin')
                    ],
                    nationality: Nationality.find_by_name('Polish'),
                    password: '123',
                    password_confirmation: '123',
                    email: 'admin@digiprint.pl',
                },
                {
                    first_name: 'Marcin',
                    last_name: 'Dylewski',
                    roles: [
                        Role.find_by_name('Admin'),
                        Role.find_by_name('Player'),
                    ],
                    nationality: Nationality.find_by_name('Polish'),
                    password: '123',
                    password_confirmation: '123',
                    email: 'bounceerr@gmail.com',
                    tournaments: main
                },
            ]

10.times do |i|
  User.create first_name: 'Player',
              last_name: "#{i+1}",
              roles: [
                  Role.find_by_name('Player')
              ],
              nationality: Nationality.find_by_name('Polish'),
              password: '123',
              password_confirmation: '123',
              email: "player#{i+1}@example.org",
              tournaments: main,
              active: true
end

Match.delete_all

Score.delete_all

Round.delete_all

Table.delete_all
Table.create [
                 {
                     name: 'Medieval Madness',
                 },
                 {
                     name: 'Road Show',
                 },
                 {
                     name: 'Indiana Jones'
                 },
                 {
                     name: 'Creature from the blue lagoon',
                 },
                 {
                     name: 'Twilight Zone',
                 },
                 {
                     name: 'Demolition Man',
                 },
                 {
                     name: 'No fear',
                 },
                 {
                     name: 'The Addams Family',
                 },
                 {
                     name: 'Phantom of the opera',
                 },
                 {
                     name: 'Terminator 2',
                 },
                 {
                     name: 'Monster Bash',
                 },
                 {
                     name: 'Tales of the arabian nights',
                 },
                 {
                     name: 'White Water',
                 },
                 {
                     name: 'Attack from Mars',
                 }
            ]

