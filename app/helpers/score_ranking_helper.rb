module ScoreRankingHelper
    def clacTotalScore scores
        sum = 0
        scores.each do |item|
            sum += item.score_result
        end
        return sum
    end

end
