class Project < ActiveRecord::Base
	validates :name, uniqueness: true
	validates :name, presence: true
	validates :name, length: {maximum: 30}
	validates :priority, presence: true, inclusion: {in: [1,2,3,4,5]}


	has_many :entries
	
	def self.low_priority
		where("priority < 3")
	end

	def self.iron_high_priority
		where("name like 'Ironhack%' AND priority = 3")
	end

	def self.clean_old
		where("priority < 2").destroy_all
	end

end

