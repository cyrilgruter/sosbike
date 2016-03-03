# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Review.destroy_all
Repair.destroy_all
User.destroy_all

User.where(email: ["thomas@user.fr", "jean@saver.fr", "arthur@saver.fr", "lauren@saver.fr"]).destroy_all

# User
thomas = User.create!(email: "thomas@user.fr", first_name: "Thomas", password: "00000000", saver: false, phone:"0765632290")


# Réparateur
jean_photo = Cloudinary::Uploader.upload("http://www.ouest-france.fr/sites/default/files/styles/image-640x360/public/2013/09/29/la-fin-de-cycle-dandre-reparateur-de-velos-en-ville.jpg")
jean = User.create!(email: "jean@saver.fr", password: "00000000", first_name: "Jean", saver: true, photo: jean_photo)

arthur_photo = Cloudinary::Uploader.upload("http://images.sudouest.fr/images/2012/06/20/747892_20531179_460x306.jpg")
arthur = User.create!(email: "arthur@saver.fr", password: "00000000", first_name: "Arthur", saver: true, photo: arthur_photo)

lauren_photo = Cloudinary::Uploader.upload("http://img.over-blog.com/300x200/4/23/46/50/more_lauren_by_matt_lingo3.jpg")
lauren = User.create!(email: "lauren@saver.fr", first_name: "Lauren", password: "00000000", saver: true, photo: lauren_photo)

# Repairs
repu = Repair.create!(address: "45 Boulevard de la Republique 75011 Paris", category: "flat tire", client: thomas)
oberkampf = Repair.create!(address: "100 rue Oberkampf 75011 Paris", category: "worn brakes", client: thomas)
wagon = Repair.create!(address: "16 villa Gaudelet 75011 Paris", category: "broken chain", client: thomas, saver: arthur)

review1 = Review.create!(content:"very good", user_id: jean.id, rating: 3)
review2 = Review.create!(content:"so fast, I save my day", user_id: jean.id, rating: 3)
review3 = Review.create!(content:"a very nice saver and very efficient !", user_id: lauren.id, rating: 4)
review4 = Review.create!(content:"Sooooo nice !", user_id: lauren.id,rating: 5)
