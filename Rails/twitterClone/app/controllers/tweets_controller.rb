class TweetsController < ApplicationController

	def index
		@tweets = Tweet.order("created_at DESC")
		@tweet = Tweet.new
	end

	def create 
		@tweet = Tweet.new(content: params[:tweet][:content])

		@tweet.save

		redirect_to "/"
	end
end
