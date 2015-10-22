class Task
    attr_accessor :content, :completion, :id, :created_at
    @@current_id = 1
    def initialize(content)
        @content = content
      	@id = @@current_id 
        @@current_id += 1
        @completion = false
        @created_at = DateTime.now
    end
    def complete?
    	@completion 
    end
    def complete!
    	@completion = true
    end
    def make_incomplete!
    	@completion = false
    end
    def created_at
    	@created_at
    end
    def update_content(new_content)
    	@content = new_content
    end
    def update_date
    	@created_at = DateTime.now
    end
end