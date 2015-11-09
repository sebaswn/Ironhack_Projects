class ConcertController < ApplicationController

	def indexToday
		@concerts_today = Concert.where(date: Date.today)
	end

	def indexMonth
		@concerts_month = Concert.where("date < ?", [Date.today + 1.month]).order('date ASC')
	end

	def indexWeek
		@concerts_week = Concert.where("date < ?", [Date.today + 1.week]).order('date ASC')

	end

	def indexAll
		@concerts_all = Concert.order('date ASC')
	end

	def root
	end

	def show
		project_id = params[:project_id]
		@concert = Concert.find_by(id: project_id)
	end

	def add
		@concert = Concert.new
	end



end


