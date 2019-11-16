class CreateFactelevator < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.integer :elevator_id
      t.string :serial_number
      t.date :initial_service_date
      t.integer :building_id
      t.integer :customer_id
      t.string :city_of_building
    end
  end
end
