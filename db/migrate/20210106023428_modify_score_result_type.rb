class ModifyScoreResultType < ActiveRecord::Migration[6.0]
  def change
    change_column :score_results, :score_result, :float
  end
end
