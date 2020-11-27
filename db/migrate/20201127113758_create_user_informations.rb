class CreateUserInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_informations do |t|
      t.string :nickname
      t.string :school

      t.belongs_to :User, index: true
      t.timestamps
    end
  end
end
