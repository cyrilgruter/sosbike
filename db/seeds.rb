# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.where(email: ["thomas@user.fr", "jean@saver.fr", "arthur@saver.fr", "lauren@saver.fr"]).destroy_all

# User
thomas = User.create!(email: "thomas@user.fr", first_name: "Thomas", password: "00000000", saver: false, phone:"06000000")


# Réparateur
jean = User.create!(email: "jean@saver.fr", password: "00000000", first_name: "Jean", saver: true)
arthur = User.create!(email: "arthur@saver.fr", password: "00000000", first_name: "Arthur", saver: true)
lauren = User.create!(email: "lauren@saver.fr", first_name: "Lauren", password: "00000000", saver: true)

# Repairs
repu = Repair.create!(address: "45 Boulevard de la Republique 75011 Paris", category: "flat tire", client: thomas)
oberkampf = Repair.create!(address: "100 rue Oberkampf 75011 Paris", category: "worn brakes", client: thomas)
wagon = Repair.create!(address: "16 villa Gaudelet 75011 Paris", category: "broken chain", client: thomas, saver: arthur)

review1 = Review.create!(content:"very good")
review2 = Review.create!(content:"so fast, I save my day")
review3 = Review.create!(content:"a very nice saver and very efficient !")
review4 = Review.create!(content:"Sooooo nice !")
