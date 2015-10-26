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
Nationality.create name: "Polish", flag_img_path: "polish.jpg"
Nationality.create name: "English", flag_img_path: "english.jpg"
