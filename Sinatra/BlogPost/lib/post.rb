class Post
	attr_accessor :name, :content, :author, :time_stamp, :id, :category
	@@current_id = 0

	def initialize(name, content, author, category)
		@name = name
		@content = content
		@author =  author
		@category = category
		@time_stamp = DateTime.now
		@@current_id = @@current_id + 1
		@id = @@current_id

	end
end




