class SitesController < ApplicationController
	def home
		render 'home' #name of view template
	end

	def contact
		render 'contact'
	end


end
