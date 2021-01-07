module SubmitFilesHelper
    def clear_counter
        @count = 0;
    end

    def index_counter
        @count = @count + 1
    end

    def counter_is_zero?
        @count == 0
    end
end
