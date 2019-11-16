class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone_number
      t.string :type_of_building 
      t.integer :apartments_number
      t.integer :floors_number
      t.integer :undergrounds_number
      t.integer :stores_number
      t.integer :cage_number
      t.integer :parking_places
      t.integer :companies_number
      t.integer :occupants_per_floor
      t.integer :open_hours
      t.integer :estimate_cage_number
      t.string :range_of_elevator
      t.decimal :unit_price, precision:10, scale:2
      t.decimal :elevator_price, precision:10, scale:2
      t.decimal :installation_cost, precision:10, scale:2
      t.decimal :total_price, precision:10, scale:2
      t.timestamps
    end
  end
end
