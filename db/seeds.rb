# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Repair.destroy_all


billy = User.create!(email: "billy@user.fr", first_name: "Billy", password: "00000000", saver: false, phone:"06000000")

matthias = User.create!(email: "matthias@reparator.fr", password: "00000000", saver: true)
cyril = User.create!(email: "cyril@reparator.fr", password: "00000000", saver: true)
laure = User.create!(email: "laure@reparator.fr", password: "00000000", saver: true)

repu = Repair.create!(address: "45 Boulevard de la Republique 75011 Paris", category: "flat tire", client: billy)
oberkampf = Repair.create!(address: "100 rue Oberkampf 75011 Paris", category: "worn brakes", client: billy)
wagon = Repair.create!(address: "16 villa Gaudelet 75011 Paris", category: "broken chain", client: billy, saver: matthias)
