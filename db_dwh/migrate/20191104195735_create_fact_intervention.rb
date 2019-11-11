class CreateFactIntervention < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.integer :employee_id
      t.integer :building_id
      t.integer :battery_id, null: true
      t.integer :column_id, null: true
      t.integer :elevator_id, null: true
      t.datetime :date_time_start_intervention
      t.datetime :date_time_end_intervention, null: true
      t.string :results
      t.string :reports, null: true
      t.string :status 
    end
  end
end
