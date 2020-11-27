class User < ApplicationRecord
    has_one    :UserInformation
    belongs_to :Grant
    has_many   :ScoreResults
    has_many   :FileUploads
end
