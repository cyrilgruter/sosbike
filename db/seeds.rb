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

User.where(email: ["cyril@user.com", "john@saver@saver.com", "arthur@saver.com", "lauren@saver.com"]).destroy_all

# User

cyril = User.create!(email: "cyril@user.com", first_name: "Cyril", password: "00000000", saver: false, phone:"0765632290")



# Réparateur
john_photo = Cloudinary::Uploader.upload("http://www.ouest-france.fr/sites/default/files/styles/image-640x360/public/2013/09/29/la-fin-de-cycle-dandre-reparateur-de-velos-en-ville.jpg")
john = User.create!(email: "john@saver.com", password: "00000000", first_name: "John", saver: true, photo: john_photo)

arthur_photo = Cloudinary::Uploader.upload("http://images.sudouest.fr/images/2012/06/20/747892_20531179_460x306.jpg")
arthur = User.create!(email: "arthur@saver.com", password: "00000000", first_name: "Arthur", saver: true, photo: arthur_photo)

lauren_photo = Cloudinary::Uploader.upload("http://img.over-blog.com/300x200/4/23/46/50/more_lauren_by_matt_lingo3.jpg")
lauren = User.create!(email: "lauren@saver.com", first_name: "Lauren", password: "00000000", saver: true, photo: lauren_photo)

# Repairs
repu = Repair.create!(address: "67 Waterloo Avenue, London", category: "flat tyre", client: cyril)
oberkampf = Repair.create!(address: "56 Backer Street, London", category: "worn brakes", client: cyril)
wagon = Repair.create!(address: "16 Gaudelet Villa, London", category: "broken chain", client: cyril, saver: arthur)

review1 = Review.create!(content:"Arrived so soon, so efficient!", user_id: john.id, rating: 3)
review2 = Review.create!(content:"So fast, John saved my day", user_id: john.id, rating: 3)
review3 = Review.create!(content:"A very nice saver and very efficient !", user_id: lauren.id, rating: 4)
review4 = Review.create!(content:"Sooooo nice !", user_id: lauren.id,rating: 5)
