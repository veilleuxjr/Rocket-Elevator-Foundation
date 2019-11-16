class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.integer :serial_number
      t.string :model
      t.string :type_of_building
      t.string :status
      t.date :starting_service_date
      t.date :last_inspection_date
      t.string :inspection_certificate
      t.text :information
      t.text :notes
    end
  end
end

