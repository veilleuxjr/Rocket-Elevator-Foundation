class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :client
      t.string :building
      t.string :battery
      t.string :column
      t.string :employee
      t.string :Description

      t.timestamps
    end
  end
end
