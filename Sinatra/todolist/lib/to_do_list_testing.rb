
RSpec.describe "ToDoList" do
	before :each do
		@task1 = Task.new("eat food")
		@task2 = Task.new("drink water")
		@todolist = TodoList.new("sebas")
	end
	it "adds task to ToDo list" do
		expect(@todolist.add_task(@task1)).to match_array([@task1])
		expect(@todolist.add_task(@task2)).to match_array([@task1, @task2])
	end
	it "delets task with specified id" do
		@todolist.add_task(@task1)
		@todolist.add_task(@task2)
		expect(@todolist.delete_task(12)).to match_array([@task1])
	end
	it "find's task with specified id" do
		@todolist.add_task(@task1)
		@todolist.add_task(@task2)
		expect(@todolist.find_task_by_id(14)).to match_array([@task2])
	end
	it "sorts tasks by date" do
		@todolist.add_task(@task1)
		@todolist.add_task(@task2)
		@task2.instance_variable_set(:@created_at, DateTime.now + 70000)
		expect(@todolist.sorted_by_time).to match_array([@task1, @task2])
	end
	it "saves the current tasks" do
		@todolist.add_task(@task1)
		@todolist.add_task(@task2)
		@todolist.save
	end

	it "loads the tasks" do

	end

end
