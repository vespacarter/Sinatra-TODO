class Task
    attr_reader :content, :id, :current_id, :completed_status, :created_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed_status = false
        @created_at = Time.now.strftime("%d/%m/%Y %H:%M")
        @updated_at = nil
    end

    def get_current_id
    	@@current_id
    end

    def complete!
    	@completed_status = true
    end

    def make_incomplete!
    	@completed_status = false
    end

    def completed?
    	@completed_status
    end

    def update_content!(text)
    	@content = text
    	@updated_at = Time.now.strftime("%d/%m/%Y %H:%M")
    end

end