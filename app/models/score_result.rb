class ScoreResult < ApplicationRecord
    belongs_to :ScoreBase
    belongs_to :User
end
