class ProjectsController < ApplicationController

	def index
		@projects = Project.all
		render "shared/error" if @projects.empty?
	end


	def show
		@project = Project.find params[:id]
	end

	def new 
		@project = Project.new
	end


	def create

		@project = Project.create({
			name: params[:project][:name],
			description: params[:project][:description],
			priority: params[:project][:priority]
			})

		if @project.save
			redirect_to '/projects'
		else
			render 'new'
		end

	end

	def destroy
		project = Project.find_by(id: params[:id])
		project.destroy
		redirect_to projects_path(project)
	end

end
