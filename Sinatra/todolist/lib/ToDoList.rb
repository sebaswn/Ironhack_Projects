require 'pry'
#require './to_do_list_task_testing.rb'
#require './to_do_list_testing.rb'
#require './Task.rb'
require 'YAML/Store'

class TodoList
    attr_accessor :tasks
    def initialize(user)
    	@todo_store = YAML::Store.new("./public/tasks.yml")
    	@user = user
        @tasks = []
    end
    def add_task(task)
    	@tasks << task
    end
    def delete_task(number)
    	@tasks.delete_if {|task| task.id == number}
    end
    def find_task_by_id(number)
    	@tasks.select {|task| task.id == number}
    end
    def sorted_by_time
    	@tasks.sort do |a, b| 
    		a.created_at <=> b.created_at
    	end
    end
    def save
    	@todo_store.transaction do 
            @todo_store[@user] = []
    		@todo_store[@user] = @tasks
    	end
    end
    def load
        @tasks = []
        @todo_store.transaction do
            @todo_store[@user].each do |task|
                @tasks.push(task)
            end
        end
    end
end






# a = Task.new("dsbhjbsd")
# b = Task.new("dsbhdsdsjbsd")
# c = TodoList.new("ben")
# c.add_task(a)
# c.add_task(b)
# c.save

# h = Task.new("Finish this exercise")
# j = Task.new("Soon")
# k = TodoList.new("sebas")
# k.add_task(h)
# k.add_task(j)
# k.save

# c.load
#c.delete_task(1)