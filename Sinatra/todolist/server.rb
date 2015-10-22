require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative('./lib/Task.rb')
require_relative('./lib/TodoList.rb')

todo_list = TodoList.new("Sebas")

# a = Task.new("Call your parents")
# b = Task.new("Do the dishes")
# c = Task.new("Wash your clothes")
# d = Task.new("Finish this exercise")

# todo_list.add_task(a)
# todo_list.add_task(b)
# todo_list.add_task(c)
# todo_list.add_task(d)
# todo_list.save
todo_list.load

get "/tasks" do
	todo_list.load
	@list = todo_list.tasks
	erb(:task_index)
end

get "/add_new_task" do

	todo_list.save
	erb(:add_new_task)
end

post "/adding_new_task" do
	new_task = params[:new_task]
	todo_list.add_task(Task.new(new_task))
	todo_list.save
	redirect "/tasks"
end

post "/complete_task" do
	completed_task = params[:id].to_i
	x = todo_list.find_task_by_id(completed_task)
	if x[0].complete?
		x[0].make_incomplete!
	else
		x[0].complete!
	end
	todo_list.save
	redirect "/tasks"
end

post "/delete_task" do
	deleted_task = params[:id].to_i
	todo_list.delete_task(deleted_task)
	todo_list.save
	redirect "/tasks"
end



