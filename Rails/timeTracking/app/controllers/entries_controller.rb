class EntriesController < ApplicationController

	def index
		@project = Project.find_by(id: params[:project_id])
		if @project.nil?
			render template: "shared/error"
		else
			@entries = @project.entries
		end

		@methods = Entry.new

	end

	def new
		@project = Project.find_by(id: params[:project_id])
		@entry = Entry.new
	end

	def create
		project_id = params[:project_id]
		@project = Project.find_by(id: project_id)

		@entry = @project.entries.new(entry_params)

		# @entry = @project.entries.new({
		# 	hours: params[:entry][:hours],
		# 	minutes: params[:entry][:minutes],
		# 	date: params[:entry][:date],
		# 	comments: params[:entry][:comments]
		# 	})

		if @entry.save
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		else
			flash["errors"] = @entry.errors.full_messages
			redirect_to new_project_entry_path(@project.id)
		end
	end


	def destroy
		entry = Entry.find_by(id: params[:id])
		entry.destroy
		flash["notice"] = "Entries succesfully removed"
		redirect_to project_entries_path(entry.project_id)
	end

	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date, :comment)
	end

end
