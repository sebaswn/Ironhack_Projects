require 'rspec'
RSpec.describe "Tasks" do
	before :each do
		@task = Task.new("s")
	end
	it "gives task id" do
		expect(@task.id).to eq(1)
	end
	it "gives task content" do
		expect(@task.content).to eq("s")
	end
	it "gives status of task before finishing" do
		expect(@task.complete?).to be false
	end
	it "sets status of task to complete" do 
		@task.complete!
		expect(@task.complete?).to be true
	end
	it "sets status to incomplete" do
		@task.complete!
		@task.make_incomplete!
		expect(@task.complete?).to be false
	end
	it "sets the time that the task was made" do
		expect(@task.created_at).to be_within(0.0000001).of(DateTime.now)
	end
	it "updates content of task" do
		expect(@task.update_content("o")).to eq("o")
	end
	it "updates date of Task" do
		expect(@task.update_date).to be_within(0.0000001).of(DateTime.now)
	end
end