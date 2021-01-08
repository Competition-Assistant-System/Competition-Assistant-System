class ScoreRankingController < ApplicationController
    def index
        @rank = User.joins(score_results: :score_base)
            .group("users.id")
            .order("sum(score_results.score_result * score_bases.weight) desc")
            .where(:grant_id=>1)
        @score_item = ScoreBase.all.order(:id)
    end
end
