class ScoreRankingController < ApplicationController
    def index
        @rank = User.joins(:score_results)
            .group("users.id")
            .order("sum(score_results.score_result) desc")
        @score_item = ScoreBase.all.order(:id)
    end
end
