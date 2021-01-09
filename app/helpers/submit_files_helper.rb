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

    def find_user_score item
        find_user_score_result_by_id(item.id).score_origin
    end

    def find_user_result item
        find_user_score_result_by_id(item.id).score_result
    end

    def find_user_score_result_by_id id
        record = @user.score_results.find_by_id id
        if record.nil?
            @user.score_results.create(score_base_id: id,score_origin:0)
        else
            record
        end
    end
end
