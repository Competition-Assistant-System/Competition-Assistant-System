module ScoreRankingHelper
    def clacTotalScore scores
        sum = 0
        scores.each do |item|
            sum += item.score_result * item.score_base.weight
        end
        return sum.round(2)
    end

end
