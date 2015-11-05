
Tweet.destroy_all
puts("--------------Destroyed all tweets-------------")

20.times do |i|
	Tweet.create(content: Faker::Hacker.say_something_smart)
end
puts("-------------Created 20 mart Tweets-------------")