class CreateGrants < ActiveRecord::Migration[6.0]
  def change
    create_table :grants do |t|
      t.string :group_name
      t.boolean :sys_admin
      t.boolean :sys_read
      t.boolean :sys_download
      t.boolean :sys_upload

      t.timestamps
    end
  end
end
