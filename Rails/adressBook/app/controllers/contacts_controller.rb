class ContactsController < ApplicationController

	def index
		@contacts = Contact.order('name ASC')
	end

	def new
		@contact = Contact.new
	end

 	def create
	    contact = Contact.new(
	      :name => params[:contact][:name],
	      :address => params[:contact][:address],
	      :phone => params[:contact][:phone],
	      :email => params[:contact][:email])

    	contact.save

    	redirect_to("/")
	 end

	 def show
	 	@project = Contact.find params[:id]
	 end


end
