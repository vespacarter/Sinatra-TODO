require_relative "../lib/todo.rb"
require_relative "../lib/task.rb"
require "spec_helper"

describe "ToDo list management" do 
	before :each do
		@mytask = Task.new("Pee")
    @mytodolist = TodoList.new("Carter")
	end
  it "adds task to list" do
    @mytodolist.add_task(@mytask)
    expect(@mytodolist.tasks.size).to eq(1)
  end
  it "deletes task to list" do
    @mytodolist.add_task(@mytask)
    @mytodolist.delete_task(1)
    expect(@mytodolist.tasks.size).to eq(0)
  end
  it "finds a task by its id" do
    @mytodolist.add_task(@mytask)
    result = @mytodolist.find_task_by_id(1)
    expect(result.size).to eq(1)
  end
  it "tries to find a non-exist task" do
    result = @mytodolist.find_task_by_id(1)
    expect(result.size).to eq(0)
  end   

  it "sorts tasks my creation date/time" do
    @othertask = Task.new("Poo")
    @mytodolist.add_task(@mytask)
    @mytodolist.add_task(@othertask)
    sorted_tasks = @mytodolist.sort_by_created("ASC")
    expect(sorted_tasks.size).to eq(2)
  end  
end
