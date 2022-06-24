require "faker"
User.delete_all
List.delete_all
Task.delete_all

puts "seeding files"

5.times do 
    User.create(name: Faker::Name.name, password: "enid" )
end 

10.times do
    List.create(name: Faker::Lorem.word, user_id: rand(1..User.all.count))
end   

50.times do
    Task.create(name: Faker::Lorem.word, user_id: rand(1..User.all.count), list_id: rand(1..List.all.count))
end 

puts "Done seeding"