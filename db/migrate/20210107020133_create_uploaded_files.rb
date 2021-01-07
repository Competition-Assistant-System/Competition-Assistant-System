class CreateUploadedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :uploaded_files do |t|
      t.string :name
      t.string :uploaded_file_url

      t.timestamps
    end
  end
end
