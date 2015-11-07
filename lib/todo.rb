class TodoList
    attr_reader :tasks
    def initialize(user)
    	@user = user
        @tasks = []
    end

    def add_task(task)
    	@tasks.push(task)
    end

    def delete_task(id)
    	@tasks.reject!{|task| task.id == id }
    end

    def find_task_by_id(id)
    	result = @tasks.select{ |task| task.id == id}
    	return result.size == 0 ? nil : result
    end

    def sort_by_created(how = "ASC")
    	how.upcase!
    	case how
    	when "ASC"
    		sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
   		when "DES"
			sorted_tasks = @tasks.sort { | task1, task2 | task2.created_at <=> task1.created_at }
    	else
    		sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
    	end
    	sorted_tasks
    end
end