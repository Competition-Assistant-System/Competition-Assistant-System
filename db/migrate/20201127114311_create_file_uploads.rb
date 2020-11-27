class CreateFileUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :file_uploads do |t|
      t.bigint :file_size
      t.string :file_path

      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
