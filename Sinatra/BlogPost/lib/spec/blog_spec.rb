


RSpec.describe "Blog" do
	before :each do
		@blog1 = Blog.new("My Blog")
		@post1 = Post.new("First Post", "This is my first post!!", "Sebas", "World News")
		@post2 = Post.new("Favorite Food", "My favorite food is tortilla", "Bob", "Culture")
		@post3 = Post.new("My favorie Movie", "My favorite movie is Memento", "Sebas", "Culture")
	end

	it 'adds new post to blog' do
		@blog1.add_post(@post1)
		@blog1.add_post(@post2)
		@blog1.add_post(@post3)
		expect(@blog1.blog_posts).to match_array([@post1, @post2, @post3])
	end

	it 'returns title of post' do
		@blog1.add_post(@post1)
		@blog1.add_post(@post2)
		expect(@blog1.title(0)).to eq("First Post")
		expect(@blog1.title(1)).to eq("Favorite Food")
	end

	it 'returns date of post' do
		@blog1.add_post(@post1)
		expect(@blog1.date(0)).to be_within(0.00000001).of(DateTime.now)
	end

	it 'returns content of post' do
		@blog1.add_post(@post1)
		expect(@blog1.text(0)).to eq("This is my first post!!")
	end

	it 'returns an array of posts' do
		@blog1.add_post(@post1)
		@blog1.add_post(@post2)
		@blog1.add_post(@post3)
		expect(@blog1.posts).to match_array(@blog1.blog_posts)
	end

	it 'returns an array of posts in order of time created' do
		@blog1.add_post(@post1)
		@blog1.add_post(@post2)
		@blog1.add_post(@post3)

		@post2.instance_variable_set(:@time_stamp, DateTime.now + 7869.976784)
		@post3.instance_variable_set(:@time_stamp, DateTime.now + 12897.765437)

		expect(@blog1.post_latest).to match_array([@post2, @post3, @post1])
	end

	it 'returns the id of the post' do 
		@blog1.add_post(@post1)
		@blog1.add_post(@post2)
		@blog1.add_post(@post3)

		expect(@blog1.id(2)).to eq(24)
	end

	it 'returns the category of the post' do
		@blog1.add_post(@post1)
		@blog1.add_post(@post2)
		expect(@blog1.category(1)).to eq("Culture")

	end

end