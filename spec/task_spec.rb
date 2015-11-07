require_relative "../lib/task.rb"
require "spec_helper"

describe "Task management" do 
	before :each do
		@mytask = Task.new("Pee")
	end
  it "updates next id to be used" do
    expect(@mytask.get_current_id).to eq(2)
  end
  it "completes task" do
  	@mytask.complete!
    expect(@mytask.completed?).to eq(true)
  end
  it "checks if task has been completed" do
    expect(@mytask.completed?).to eq(false)
  end	

  it "makes task incomplete" do
  	@mytask.complete!
  	@mytask.make_incomplete!
    expect(@mytask.completed?).to eq(false)
  end
	it "updates task text" do
  	@mytask.update_content!("Poo")
    expect(@mytask.content).to eq("Poo")
  end

end

