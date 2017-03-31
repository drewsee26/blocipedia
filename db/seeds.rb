require 'faker'

#Create Users
5.times do 
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Lorem.unique.sentence
    )
end

users = User.all

#Create Wikis
20.times do
    Wiki.create!(
        user: users.sample,
        title: Faker::Lorem.unique.sentence,
        body: Faker::Lorem.unique.paragraph,
        private: false
    )
end


puts "Seeds finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"