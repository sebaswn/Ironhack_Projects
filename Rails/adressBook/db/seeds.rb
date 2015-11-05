# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Contact.destroy_all

puts("Deleted all Contacts")
puts("---------------------------")

Contact.create(name: "Sebastian Nee", phone: 9173, address: "Main street, Central City, Major Country.", email: "email@email.email")
Contact.create(name: "Darth Vader", phone: 1234, address: "Hallway A18, Death Star.", email: "darth@vader.darkside")
Contact.create(name: "James Bon", phone: 0070, address: "#7, Double O st, MI6.", email: "bondjames@secret.service")

puts("Created new Contacts")
puts("---------------------------")