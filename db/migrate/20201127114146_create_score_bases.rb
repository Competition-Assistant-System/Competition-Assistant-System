class CreateScoreBases < ActiveRecord::Migration[6.0]
  def change
    create_table :score_bases do |t|
      t.string :base_name
      t.integer :base_score
      t.float :weight

      t.timestamps
    end
  end
end
