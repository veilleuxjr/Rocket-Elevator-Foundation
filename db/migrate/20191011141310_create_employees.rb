class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.references :user, foreign_key: true
      t.timestamps null:false
    end
    add_index :employees, :email,                unique: true
  end
end