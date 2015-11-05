#rake db:seed

Project.destroy_all

puts("Deleted all Projects")
puts("----------------------------")

Entry.destroy_all

puts("Deleted all Entries")
puts("----------------------------")

(1..5).each do |i|
	Project.create(name: "Ironhack number #{i}", priority: rand(1..3), description: "Hello, description #{i}")
	Project.create(name: "Personal number #{i}", priority: rand(1..3), description: "Hello, description #{i}")

end

puts("Created new Projects")
puts("----------------------------")

words= ["bird", "monkey", "fire", "American", "superpowers", "Jack", "potato", "godzilla", "funky", "jazzy", "cute"]


Project.all.each do |project|
	(1..5).each do |y|
		Entry.create(hours: rand(1..4), 
					minutes: rand(1..59), 
					comments: "#{words[rand(0..words.length-1)]} #{words[rand(0..words.length-1)]} #{words[rand(0..words.length-1)]}", 
					date: (Date.yesterday), 
					project_id: project.id)
	end
end

puts("Created new Entries")
puts("----------------------------")