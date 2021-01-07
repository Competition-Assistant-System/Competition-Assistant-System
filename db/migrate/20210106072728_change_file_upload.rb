class ChangeFileUpload < ActiveRecord::Migration[6.0]
  def change
    add_column :file_uploads, :file_md5, :string
    rename_column :file_uploads, :file_path, :file_name
  end
end
