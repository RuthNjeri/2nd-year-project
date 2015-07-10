require 'faker'

namespace :db do
 desc "Fill datbase with sample data"
 task :populate => :environment do
   Rake::Task['db:reset'].invoke
   User.create!(name: "Grace",
               email: "gangstar@gmail.com",
               password:"thuglife",
               password_confirmation: "thuglife",
               admin: true)
    80.times do |n|
     name = Faker::Name.name
     email="example-#{n+1}@railstutorial.org"
     password= "password"
     User.create!(:name => name,
                  :email =>email,
                  :password =>password,
                  :password_confirmation =>password)
  end             
 end
end
