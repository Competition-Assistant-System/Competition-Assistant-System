class CreateScoreResults < ActiveRecord::Migration[6.0]
  def change
    create_table :score_results do |t|
      t.integer :score_origin
      t.integer :score_result

      t.belongs_to :ScoreBase, index: true
      t.belongs_to :User, index: true
      t.timestamps
    end
  end
end
