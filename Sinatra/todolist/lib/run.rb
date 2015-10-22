require './Task.rb'
require './ToDoList.rb'

#@first_list = TodoList.new("Josh")

a = Task.new("Finish This Exercise ASAP")
b = Task.new("Do the dishes")
c = Task.new("Wash your clothes")

@todo_list.add_task(a)
@todo_list.add_task(b)
@todo_list.add_task(c)

@todo_list.save


