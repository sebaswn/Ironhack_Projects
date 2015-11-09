puts("----------------------------")

Concert.destroy_all

puts("Destroyed all Concerts")
puts("----------------------------")

puts("----------------------------")
puts("Creating future Concerts")
1000.times do |i|
	Concert.create(band: Faker::Name.name, 
					city: Faker::Address.city, 
					venue: Faker::Company.name, 
					date: Faker::Date.forward(356),
					price: Faker::Commerce.price,
					description: Faker::Lorem.paragraph(4),
					image: Faker::Avatar.image)
	puts("count: #{i}")
end

puts("Creating today's Concerts")
4.times do |x|
	Concert.create(band: Faker::Name.name, 
					city: Faker::Address.city, 
					venue: Faker::Company.name, 
					date: Date.today,
					price: Faker::Commerce.price,
					description: Faker::Lorem.paragraph(4),
					image: Faker::Avatar.image)
	puts("count: #{x}")
end

puts("----------------------------")

puts("----------------------------")
puts("Created #{Concert.count} Concerts")
puts("----------------------------")
