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

User.delete_all
User.create first_name: 'Marcin', last_name: 'Dylewski',
            roles: [Role.find_by_name('Admin'),
                    Role.find_by_name('Player'),
                    Role.find_by_name('SuperAdmin')],
            nationality: Nationality.find_by_name('Polish')
User.create first_name: 'Jakub', last_name: 'Ciepliński',
            roles: [Role.find_by_name('Admin'),
                    Role.find_by_name('Player')],
            nationality: Nationality.find_by_name('Polish')
User.create first_name: 'David', last_name: 'Main',
            roles: [Role.find_by_name('Player')],
            nationality: Nationality.find_by_name('English')

User.create first_name: 'Ewa', last_name: 'Mezglewska',
            roles: [Role.find_by_name('Admin')],
            nationality: Nationality.find_by_name('Polish')