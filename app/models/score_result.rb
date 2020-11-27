class ScoreResult < ApplicationRecord
    belongs_to :score_base
    belongs_to :user
end
