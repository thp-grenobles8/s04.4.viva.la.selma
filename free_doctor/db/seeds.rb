# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cities ---------------------"
City.destroy_all
10.times do
  c = City.create!(name: Faker::Address.city)
  #j'utilise create! pour voir les erreurs si erreur il y a
  puts "créé Ville #{c.name}"
end

puts "Patients ------------------"
Patient.destroy_all
25.times do
  p = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.all.sample # on lui donne une ville
  )
  puts "créé Patient #{p.first_name} #{p.last_name}"
end

puts "Specialities --------------"
Specialty.destroy_all
["Pédiatre","Généraliste","Dentiste","Chirurgien",
"ORL","Psychiatre","Neurologue"].each {
  |s| #pour chaque spécialité
  Specialty.create!(label:s) #on la crée
  puts "créé Spécialité #{s}"
}

puts "Doctors --------------------"
Doctor.destroy_all
8.times do
  d = Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip,
    city: City.all.sample
  )
  puts "créé Docteur #{d.first_name}"
end

puts "Doctor-Specialty-----------"
JoinTableDoctorSpecialty.destroy_all
Doctor.all.each {
  |d| #pour chaque docteur
  rand(1..4).times do #1 a quatre spécialités
    s = Specialty.all.sample #on en tire une au hasard
    if !d.specialties.include?(s) #si ce docteur n'a pas déjà cette spé
      j = JoinTableDoctorSpecialty.create!(
        doctor: d,
        specialty: s
      )#on associe le docteur a la spécialité
      puts "Docteur #{d.first_name} est un.e #{s.label}"
    end
  end
}

puts "Appointments--------------"
Appointment.destroy_all
35.times do
  a = Appointment.create!(
    date: Faker::Date.forward,
    patient: Patient.all.sample,
    doctor: Doctor.all.sample,
    city: City.all.sample
  )
  puts "#{a.patient.first_name} a RDV avec Dr #{
  a.doctor.first_name} à #{a.city.name} le #{a.date}"
end
