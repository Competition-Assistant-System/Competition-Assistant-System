class ScoreResult < ApplicationRecord
    belongs_to :score_base
    belongs_to :user

    after_validation :calc_result_score, on: [ :create, :update ]

private
    def calc_result_score
        score_base = self.score_base.base_score
        self.score_result = self.score_origin / score_base
    end
end
