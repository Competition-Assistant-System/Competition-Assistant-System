class User < ApplicationRecord
    has_one    :user_information
    belongs_to :grant
    has_many   :score_results
    has_many   :file_uploads
end
