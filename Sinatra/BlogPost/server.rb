require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'YAML/Store'

#require_relative("./lib/spec/blog_spec.rb")

require_relative('./lib/post.rb')
require_relative('./lib/blog.rb')

blog1 = Blog.new("My Blog")

post1 = Post.new("First Post", "This is my first post!!", "Sebas", "World News")
post2 = Post.new("Favorite Food", "My favorite food is tortilla", "Bob", "Culture")
post3 = Post.new("My favorie Movie", "My favorite movie is Memento", "Sebas", "Entertainment")

blog1.add_post(post1)
blog1.add_post(post2)
blog1.add_post(post3)


get "/posts" do
	@posts = blog1.post_latest
	erb(:post)	
end

get "/postcontent/:id" do
	@ids = params[:id]
	@idx = @ids.split(/[:]/)
	@idv = @idx[1].to_i
	@posts = blog1.posts
	erb(:post_content)
end

get "/new_post" do
	erb(:create_new_post)
end

post "/adding_new_post" do
	new_post_title = params[:title_of_post]
	new_post_content = params[:content_of_post]
	new_post_category = params[:category_of_post]
	new_post_user = params[:user_of_post]

	x = Post.new(new_post_title, new_post_content, new_post_user, new_post_category)
	blog1.add_post(x)

	redirect("/posts")
end

