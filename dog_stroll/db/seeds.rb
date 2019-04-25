# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "suppression de la base ..."
JoinStrollDog.destroy_all
Dog.destroy_all
Stroll.destroy_all
Dogsitter.destroy_all
City.destroy_all
puts "... base vidée"

puts "VILLES ----------------"
6.times {
  c = City.create!(
    name: Faker::Address.city
  )
  puts "la Ville de #{c.name} a rejoint l'appli"
}

puts "DOGGOS ---------------"
names = ["Youki","Médor","Cachou","Rantanplan",
  "Milou","Mirza","Snoopy"]
19.times { |i|
  d = Dog.create!(
    name: names.sample + i.to_s,
    city: City.all.sample
  )
  puts "le chien #{d.name} s'est inscrit !"
}

puts "PROMENEURS ----------------"
7.times {
  d = Dogsitter.create!(
    name: Faker::Name.first_name,
    city: City.all.sample
  )
  puts "le promeneur #{d.name} s'est proposé !"
}

puts "PROMENADES avec gens ET chiens----------------"
20.times {
  s = Stroll.create!(
    dogsitter: Dogsitter.all.sample
  )
  puts "#{s.dogsitter.name} propose une promenade à #{s.dogsitter.city.name} AVEC"
  rand(1..6).times { # seuls les chiens de la même ville peuvent rejoindre la promenade
    d = Dog.where(city_id: s.dogsitter.city.id).sample
    if !s.dogs.include?(d) #si le chien n'est pas déjà dans la promenade
      j = JoinStrollDog.create!( #on ajoute le chien a la promenade
        dog: d,
        stroll: s
      )
      puts " - #{j.dog.name} de #{j.dog.city.name}" #on affiche le nom du chien
    end
  }
}
