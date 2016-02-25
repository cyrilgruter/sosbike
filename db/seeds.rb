# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
reparator1 = User.create(email: "matthias@reparator.fr", password: "00000000", saver: true)
reparator2 = User.create(email: "cyril@reparator.fr", password: "00000000", saver: true)
reparator3 = User.create(email: "laure@reparator.fr", password: "00000000", saver: true)
