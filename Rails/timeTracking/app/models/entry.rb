class Entry < ActiveRecord::Base
	validates :project, presence: true
	validates :hours, numericality: { only_integer: true }, presence: true
	validates :minutes, numericality: { only_integer: true }, presence: true
	validates :date, presence: true 

	belongs_to :project

	def add_time(entries)
		total_minutes = 0
		total_hours = 0
		entries.each do |entry| 
			total_minutes =  total_minutes + entry.minutes 
			total_hours = total_hours + entry.hours
		end

		total_hours = total_hours + convert_minutes(total_minutes)
		total_minutes = total_minutes%60

		total_hours.to_s 
		total_minutes.to_s

		return total = "#{total_hours} hours, #{total_minutes} minutes."

	end

	def convert_minutes(total_minutes)
		return total_minutes/60
	end

	def create
		obj = Obj.new(params[:obj])
		if obj.save
			redirect_to "/objs/#{obj.id}"
		else
			@errors = obj.errors.full_messages
			render "new"
		end
	end

end