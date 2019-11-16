class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|

      t.string :type_of_column
      t.integer :number_of_floors_served
      t.string :status
      t.text :information
      t.text :notes
    end
  end
end

