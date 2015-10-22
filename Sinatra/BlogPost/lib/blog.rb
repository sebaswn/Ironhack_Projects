

class Blog
	attr_accessor :blog_posts
	def initialize(blog_name)
		@blog_name = blog_name
		@blog_posts = []
	end

	def add_post(post)
		@blog_posts.push(post)
	end

	def title(number)
		@blog_posts[number].name
	end

	def date(number)
		@blog_posts[number].time_stamp
	end

	def text(number)
		@blog_posts[number].content
	end

	def posts
		@blog_posts
	end

	def post_latest
		@new_order = @blog_posts.sort do |a, b| 
    		b.time_stamp <=> a.time_stamp
    	end
    	@new_order
	end

	def id(number)
		@blog_posts[number].id
	end

	def category(number)
		@blog_posts[number].category

	end



end
