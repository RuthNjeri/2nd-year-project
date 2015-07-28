# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Town.create!(name:"Nairobi")
Town.create!(name:"Naivasha")
Town.create!(name:"Nakuru")
Town.create!(name:"Kiambu")
Town.create!(name:"Kisumu")
User.create!(surname:'Waiganjo',name:'Ruth',email:'ruthnwaiganjo@gmail.com',password:'ruth123',admin:'true',activated:'true')
User.create!(surname:'Malio',name:'Sharon',email:'s@gmail.com',password:'sharon123',admin:'false',activated:'true')
User.create!(surname:'Maina',name:'John',email:'j@gmail.com',password:'maina123',admin:'false',activated:'true')
User.create!(surname:'Doe',name:'Jane',email:'d@gmail.com',password:'jane123',admin:'false',activated:'true')
User.create!(surname:'Kimani',name:'Caleb',email:'c@gmail.com',password:'caleb123',admin:'false',activated:'true')