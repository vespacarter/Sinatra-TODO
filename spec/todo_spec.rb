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
    listsize = @mytodolist.tasks.size
    @mytodolist.delete_task(@mytask.id)
    expect(@mytodolist.tasks.size).to eq(listsize-1)
  end
  it "finds a task by its id" do
    @mytodolist.add_task(@mytask)
    result = @mytodolist.find_task_by_id(@mytask.id)
    expect(result.size).to eq(1)
  end
  it "tries to find a non-exist task" do
    result = @mytodolist.find_task_by_id(999)
    expect(result).to eq(nil)
  end   

  it "sorts tasks by creation date/time ASC" do
    sleep (2) #waits 3 secs so next task has different timestamp
    @othertask = Task.new("Poo")
    @mytodolist.add_task(@mytask)
    @mytodolist.add_task(@othertask)
    sorted_tasks = @mytodolist.sort_by_created("ASC")
    expect(sorted_tasks[0].content).to eq("Pee")
  end

  it "sorts tasks by creation date/time DESC" do
    sleep (1) #waits 1 secs so next task has different timestamp
    @othertask = Task.new("Poo")
    @mytodolist.add_task(@mytask)
    @mytodolist.add_task(@othertask)
    sorted_tasks = @mytodolist.sort_by_created("DES")
    expect(sorted_tasks[0].content).to eq("Poo")
  end

  it "sorts tasks by creation date/time DEFAULT" do
    sleep (1) #waits 1 secs so next task has different timestamp
    @othertask = Task.new("Poo")
    @mytodolist.add_task(@mytask)
    @mytodolist.add_task(@othertask)
    sorted_tasks = @mytodolist.sort_by_created
    expect(sorted_tasks[0].content).to eq("Pee")
  end
  it "sorts tasks by creation date/time OTHER" do
    sleep (1) #waits 1 secs so next task has different timestamp
    @othertask = Task.new("Poo")
    @mytodolist.add_task(@mytask)
    @mytodolist.add_task(@othertask)
    sorted_tasks = @mytodolist.sort_by_created("ouyeah")
    expect(sorted_tasks[0].content).to eq("Pee")
  end


end
